; DESCRIPTION: Render a colored object at the screen.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r9-r31 in hex), PC counter, trace buffer entries.
; Controls: S=step, C=continue, R=reset trace, T=toggle trace
; Proves trace buffer (SNAP_TRACE / TRACE_READ) integration.
;
; The debugger demonstrates reading the trace buffer from assembly programs.
; Since registers are not directly introspectable at runtime, we use the
; trace buffer to show PC values and opcode history.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers (STRO targets)
;   0x6100          Step mode (0=running, 1=step)
;   0x6101          Trace enabled flag
;   0x6200-0x62FF   Hex scratch buffer
;   0x6400-0x640F   Hex digit lookup (16 ASCII chars)
;   0x6500-0x6513   Trace entry read buffer (20 words)
;   0x6600          Frame counter (local)
;
; Screen Layout (256x256):
;   Row 0-15:     Title bar (dark red)
;   Row 16-80:    Trace buffer info (entries, opcodes)
;   Row 80-150:   PC history from trace
;   Row 150-200:  Register snapshot from last trace entry
;   Row 220-255:  Status bar

#define TICKS     0xFFE
#define KEY_PORT  0xFFF
#define BUF       0x6000
#define STEP_MODE 0x6100
#define TRACE_ON  0x6101
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define TRACE_RD  0x6500
#define FRAME_CNT 0x6600

LDI r30, 0xFD00
LDI r12, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r12
LDI r21, 49
STORE r20, r21
ADD r20, r12
LDI r21, 50
STORE r20, r21
ADD r20, r12
LDI r21, 51
STORE r20, r21
ADD r20, r12
LDI r21, 52
STORE r20, r21
ADD r20, r12
LDI r21, 53
STORE r20, r21
ADD r20, r12
LDI r21, 54
STORE r20, r21
ADD r20, r12
LDI r21, 55
STORE r20, r21
ADD r20, r12
LDI r21, 56
STORE r20, r21
ADD r20, r12
LDI r21, 57
STORE r20, r21
ADD r20, r12
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r12
LDI r21, 66
STORE r20, r21
ADD r20, r12
LDI r21, 67
STORE r20, r21
ADD r20, r12
LDI r21, 68
STORE r20, r21
ADD r20, r12
LDI r21, 69
STORE r20, r21
ADD r20, r12
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r13, 1
STORE r20, r13
LDI r20, TRACE_ON
LDI r13, 0
STORE r20, r13
LDI r20, FRAME_CNT
LDI r13, 0
STORE r20, r13

; Start trace recording
LDI r13, 1
SNAP_TRACE r13

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r13, r20
  ADD r13, r12
  STORE r20, r13

  ; Read keyboard
  IKEY r0

  ; Handle keys
  LDI r3, 83          ; 'S' = Step mode
  CMP r0, r3
  JZ r9, key_step

  LDI r3, 67          ; 'C' = Continue
  CMP r0, r3
  JZ r9, key_continue

  LDI r3, 82          ; 'R' = Reset trace
  CMP r0, r3
  JZ r9, key_reset

  LDI r3, 84          ; 'T' = Toggle trace
  CMP r0, r3
  JZ r9, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r13, 1
  STORE r20, r13
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r13, 0
  STORE r20, r13
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r13, 2
  SNAP_TRACE r13
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r13, r20
  SNAP_TRACE r13
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r13, r20
  LDI r3, 1
  XOR r13, r3
  STORE r20, r13
  SNAP_TRACE r13
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r8, 0x0A0A1E
  FILL r8

  ; Title bar
  LDI r8, 0
  LDI r10, 0
  LDI r7, 256
  LDI r15, 16
  LDI r11, 0x8B0000
  RECTF r8, r10, r7, r15, r11

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r8, 60
  LDI r10, 3
  LDI r7, BUF
  LDI r15, 0xFFFFFF
  LDI r11, 0x8B0000
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r8, 4
  LDI r10, 20
  LDI r7, BUF
  LDI r15, 0x00FFFF
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Query trace count (mode 0)
  LDI r13, 0
  TRACE_READ r13        ; r9 = count
  MOV r4, r9           ; save count
  CALL val_to_hex      ; convert r9 to HEX_BUF
  LDI r8, 110
  LDI r10, 20
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r13=index, r8=dest addr -> writes 20 words
  CMP r4, r12
  BLT r9, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r4, r12           ; r4 = count - 1 (last index)
  MOV r13, r4
  LDI r8, TRACE_RD
  LDI r5, 1
  TRACE_READ r5        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r8, 4
  LDI r10, 34
  LDI r7, BUF
  LDI r15, 0x00FF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, TRACE_RD
  ADD r20, r12
  ADD r20, r12           ; +2 = PC
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 70
  LDI r10, 34
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r8, 4
  LDI r10, 48
  LDI r7, BUF
  LDI r15, 0x00FF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 70
  LDI r10, 48
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Show register r9 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r9:"
  LDI r8, 4
  LDI r10, 62
  LDI r7, BUF
  LDI r15, 0x88FF88
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 28
  LDI r10, 62
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Show register r12 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r12:"
  LDI r8, 100
  LDI r10, 62
  LDI r7, BUF
  LDI r15, 0x88FF88
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 124
  LDI r10, 62
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r8, 4
  LDI r10, 34
  LDI r7, BUF
  LDI r15, 0x666666
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r8, 4
  LDI r10, 80
  LDI r7, BUF
  LDI r15, 0x00FF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r8, 4
  LDI r10, 94
  LDI r7, BUF
  LDI r15, 0x00FFFF
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, TICKS
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 52
  LDI r10, 94
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r8, 120
  LDI r10, 94
  LDI r7, BUF
  LDI r15, 0x00FFFF
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r20, FRAME_CNT
  LOAD r9, r20
  CALL val_to_hex
  LDI r8, 172
  LDI r10, 94
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r8, 4
  LDI r10, 112
  LDI r7, BUF
  LDI r15, 0xFF88FF
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Count FRAME opcodes (0x02) in trace
  LDI r13, 2            ; target opcode = FRAME
  LDI r5, 2
  TRACE_READ r5        ; mode 2: r9 = count of matching opcode
  MOV r4, r9
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r8, 4
  LDI r10, 126
  LDI r7, BUF
  LDI r15, 0x88FF88
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r8, 60
  LDI r10, 126
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Count IKEY opcodes (0x48)
  LDI r13, 0x48
  LDI r5, 2
  TRACE_READ r5
  MOV r4, r9
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r8, 110
  LDI r10, 126
  LDI r7, BUF
  LDI r15, 0x88FF88
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  LDI r8, 152
  LDI r10, 126
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r8, 4
  LDI r10, 146
  LDI r7, BUF
  LDI r15, 0xFFAA00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r8, 4
  LDI r10, 160
  LDI r7, BUF
  LDI r15, 0x88FF88
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; Show LR (r31) value
  MOV r9, r31
  CALL val_to_hex
  LDI r8, 160
  LDI r10, 160
  LDI r7, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r11, 0x0A0A1E
  DRAWTEXT r8, r10, r7, r15, r11

  ; --- Status bar ---
  LDI r8, 0
  LDI r10, 236
  LDI r7, 256
  LDI r15, 20
  LDI r11, 0x1A1A2E
  RECTF r8, r10, r7, r15, r11

  ; Mode
  LDI r20, STEP_MODE
  LOAD r4, r20
  LDI r3, 0
  CMP r4, r3
  JZ r9, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r8, 4
  LDI r10, 238
  LDI r7, BUF
  LDI r15, 0xFF4444
  LDI r11, 0x1A1A2E
  DRAWTEXT r8, r10, r7, r15, r11
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r8, 4
  LDI r10, 238
  LDI r7, BUF
  LDI r15, 0x44FF44
  LDI r11, 0x1A1A2E
  DRAWTEXT r8, r10, r7, r15, r11

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r4, r20
  LDI r3, 0
  CMP r4, r3
  JZ r9, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r8, 70
  LDI r10, 238
  LDI r7, BUF
  LDI r15, 0x44FF44
  LDI r11, 0x1A1A2E
  DRAWTEXT r8, r10, r7, r15, r11
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r8, 70
  LDI r10, 238
  LDI r7, BUF
  LDI r15, 0x666666
  LDI r11, 0x1A1A2E
  DRAWTEXT r8, r10, r7, r15, r11

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r8, 140
  LDI r10, 238
  LDI r7, BUF
  LDI r15, 0x888888
  LDI r11, 0x1A1A2E
  DRAWTEXT r8, r10, r7, r15, r11

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r9 to 8-char hex string at HEX_BUF
; Clobbers r2-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r11, 1
  LDI r2, 0

vhex_loop:
  MOV r1, r9
  MOV r16, r22
  SHR r1, r16
  AND r1, r24

  LDI r16, HEX_TABLE
  ADD r16, r1
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r2
  STORE r17, r16

  SUB r22, r23
  ADD r2, r11
  LDI r18, 8
  CMP r2, r18
  BLT r9, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r2
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
