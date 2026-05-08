; DESCRIPTION: Geometry OS program to draw a colored object.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r7-r31 in hex), PC counter, trace buffer entries.
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
LDI r3, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r3
LDI r21, 49
STORE r20, r21
ADD r20, r3
LDI r21, 50
STORE r20, r21
ADD r20, r3
LDI r21, 51
STORE r20, r21
ADD r20, r3
LDI r21, 52
STORE r20, r21
ADD r20, r3
LDI r21, 53
STORE r20, r21
ADD r20, r3
LDI r21, 54
STORE r20, r21
ADD r20, r3
LDI r21, 55
STORE r20, r21
ADD r20, r3
LDI r21, 56
STORE r20, r21
ADD r20, r3
LDI r21, 57
STORE r20, r21
ADD r20, r3
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r3
LDI r21, 66
STORE r20, r21
ADD r20, r3
LDI r21, 67
STORE r20, r21
ADD r20, r3
LDI r21, 68
STORE r20, r21
ADD r20, r3
LDI r21, 69
STORE r20, r21
ADD r20, r3
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r11, 1
STORE r20, r11
LDI r20, TRACE_ON
LDI r11, 0
STORE r20, r11
LDI r20, FRAME_CNT
LDI r11, 0
STORE r20, r11

; Start trace recording
LDI r11, 1
SNAP_TRACE r11

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r11, r20
  ADD r11, r3
  STORE r20, r11

  ; Read keyboard
  IKEY r0

  ; Handle keys
  LDI r12, 83          ; 'S' = Step mode
  CMP r0, r12
  JZ r7, key_step

  LDI r12, 67          ; 'C' = Continue
  CMP r0, r12
  JZ r7, key_continue

  LDI r12, 82          ; 'R' = Reset trace
  CMP r0, r12
  JZ r7, key_reset

  LDI r12, 84          ; 'T' = Toggle trace
  CMP r0, r12
  JZ r7, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r11, 1
  STORE r20, r11
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r11, 0
  STORE r20, r11
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r11, 2
  SNAP_TRACE r11
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r11, r20
  SNAP_TRACE r11
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r11, r20
  LDI r12, 1
  XOR r11, r12
  STORE r20, r11
  SNAP_TRACE r11
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r9, 0x0A0A1E
  FILL r9

  ; Title bar
  LDI r9, 0
  LDI r2, 0
  LDI r4, 256
  LDI r14, 16
  LDI r5, 0x8B0000
  RECTF r9, r2, r4, r14, r5

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r9, 60
  LDI r2, 3
  LDI r4, BUF
  LDI r14, 0xFFFFFF
  LDI r5, 0x8B0000
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r9, 4
  LDI r2, 20
  LDI r4, BUF
  LDI r14, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Query trace count (mode 0)
  LDI r11, 0
  TRACE_READ r11        ; r7 = count
  MOV r8, r7           ; save count
  CALL val_to_hex      ; convert r7 to HEX_BUF
  LDI r9, 110
  LDI r2, 20
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r11=index, r9=dest addr -> writes 20 words
  CMP r8, r3
  BLT r7, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r8, r3           ; r8 = count - 1 (last index)
  MOV r11, r8
  LDI r9, TRACE_RD
  LDI r1, 1
  TRACE_READ r1        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r9, 4
  LDI r2, 34
  LDI r4, BUF
  LDI r14, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, TRACE_RD
  ADD r20, r3
  ADD r20, r3           ; +2 = PC
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 70
  LDI r2, 34
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r9, 4
  LDI r2, 48
  LDI r4, BUF
  LDI r14, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 70
  LDI r2, 48
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Show register r7 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r7:"
  LDI r9, 4
  LDI r2, 62
  LDI r4, BUF
  LDI r14, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 28
  LDI r2, 62
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Show register r3 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r3:"
  LDI r9, 100
  LDI r2, 62
  LDI r4, BUF
  LDI r14, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 124
  LDI r2, 62
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r9, 4
  LDI r2, 34
  LDI r4, BUF
  LDI r14, 0x666666
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r9, 4
  LDI r2, 80
  LDI r4, BUF
  LDI r14, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r9, 4
  LDI r2, 94
  LDI r4, BUF
  LDI r14, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, TICKS
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 52
  LDI r2, 94
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r9, 120
  LDI r2, 94
  LDI r4, BUF
  LDI r14, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r20, FRAME_CNT
  LOAD r7, r20
  CALL val_to_hex
  LDI r9, 172
  LDI r2, 94
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r9, 4
  LDI r2, 112
  LDI r4, BUF
  LDI r14, 0xFF88FF
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Count FRAME opcodes (0x02) in trace
  LDI r11, 2            ; target opcode = FRAME
  LDI r1, 2
  TRACE_READ r1        ; mode 2: r7 = count of matching opcode
  MOV r8, r7
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r9, 4
  LDI r2, 126
  LDI r4, BUF
  LDI r14, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r9, 60
  LDI r2, 126
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Count IKEY opcodes (0x48)
  LDI r11, 0x48
  LDI r1, 2
  TRACE_READ r1
  MOV r8, r7
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r9, 110
  LDI r2, 126
  LDI r4, BUF
  LDI r14, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  LDI r9, 152
  LDI r2, 126
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r9, 4
  LDI r2, 146
  LDI r4, BUF
  LDI r14, 0xFFAA00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r9, 4
  LDI r2, 160
  LDI r4, BUF
  LDI r14, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; Show LR (r31) value
  MOV r7, r31
  CALL val_to_hex
  LDI r9, 160
  LDI r2, 160
  LDI r4, HEX_BUF
  LDI r14, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r9, r2, r4, r14, r5

  ; --- Status bar ---
  LDI r9, 0
  LDI r2, 236
  LDI r4, 256
  LDI r14, 20
  LDI r5, 0x1A1A2E
  RECTF r9, r2, r4, r14, r5

  ; Mode
  LDI r20, STEP_MODE
  LOAD r8, r20
  LDI r12, 0
  CMP r8, r12
  JZ r7, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r9, 4
  LDI r2, 238
  LDI r4, BUF
  LDI r14, 0xFF4444
  LDI r5, 0x1A1A2E
  DRAWTEXT r9, r2, r4, r14, r5
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r9, 4
  LDI r2, 238
  LDI r4, BUF
  LDI r14, 0x44FF44
  LDI r5, 0x1A1A2E
  DRAWTEXT r9, r2, r4, r14, r5

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r8, r20
  LDI r12, 0
  CMP r8, r12
  JZ r7, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r9, 70
  LDI r2, 238
  LDI r4, BUF
  LDI r14, 0x44FF44
  LDI r5, 0x1A1A2E
  DRAWTEXT r9, r2, r4, r14, r5
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r9, 70
  LDI r2, 238
  LDI r4, BUF
  LDI r14, 0x666666
  LDI r5, 0x1A1A2E
  DRAWTEXT r9, r2, r4, r14, r5

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r9, 140
  LDI r2, 238
  LDI r4, BUF
  LDI r14, 0x888888
  LDI r5, 0x1A1A2E
  DRAWTEXT r9, r2, r4, r14, r5

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r7 to 8-char hex string at HEX_BUF
; Clobbers r15-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r5, 1
  LDI r15, 0

vhex_loop:
  MOV r10, r7
  MOV r16, r22
  SHR r10, r16
  AND r10, r24

  LDI r16, HEX_TABLE
  ADD r16, r10
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r15
  STORE r17, r16

  SUB r22, r23
  ADD r15, r5
  LDI r18, 8
  CMP r15, r18
  BLT r7, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r15
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
