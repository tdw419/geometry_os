; DESCRIPTION: Geometry OS program to draw a colored object.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r5-r31 in hex), PC counter, trace buffer entries.
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
LDI r7, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r7
LDI r21, 49
STORE r20, r21
ADD r20, r7
LDI r21, 50
STORE r20, r21
ADD r20, r7
LDI r21, 51
STORE r20, r21
ADD r20, r7
LDI r21, 52
STORE r20, r21
ADD r20, r7
LDI r21, 53
STORE r20, r21
ADD r20, r7
LDI r21, 54
STORE r20, r21
ADD r20, r7
LDI r21, 55
STORE r20, r21
ADD r20, r7
LDI r21, 56
STORE r20, r21
ADD r20, r7
LDI r21, 57
STORE r20, r21
ADD r20, r7
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r7
LDI r21, 66
STORE r20, r21
ADD r20, r7
LDI r21, 67
STORE r20, r21
ADD r20, r7
LDI r21, 68
STORE r20, r21
ADD r20, r7
LDI r21, 69
STORE r20, r21
ADD r20, r7
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r3, 1
STORE r20, r3
LDI r20, TRACE_ON
LDI r3, 0
STORE r20, r3
LDI r20, FRAME_CNT
LDI r3, 0
STORE r20, r3

; Start trace recording
LDI r3, 1
SNAP_TRACE r3

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r3, r20
  ADD r3, r7
  STORE r20, r3

  ; Read keyboard
  IKEY r4

  ; Handle keys
  LDI r2, 83          ; 'S' = Step mode
  CMP r4, r2
  JZ r5, key_step

  LDI r2, 67          ; 'C' = Continue
  CMP r4, r2
  JZ r5, key_continue

  LDI r2, 82          ; 'R' = Reset trace
  CMP r4, r2
  JZ r5, key_reset

  LDI r2, 84          ; 'T' = Toggle trace
  CMP r4, r2
  JZ r5, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r3, 1
  STORE r20, r3
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r3, 0
  STORE r20, r3
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r3, 2
  SNAP_TRACE r3
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r3, r20
  SNAP_TRACE r3
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r3, r20
  LDI r2, 1
  XOR r3, r2
  STORE r20, r3
  SNAP_TRACE r3
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r14, 0x0A0A1E
  FILL r14

  ; Title bar
  LDI r14, 0
  LDI r6, 0
  LDI r0, 256
  LDI r1, 16
  LDI r15, 0x8B0000
  RECTF r14, r6, r0, r1, r15

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r14, 60
  LDI r6, 3
  LDI r0, BUF
  LDI r1, 0xFFFFFF
  LDI r15, 0x8B0000
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r14, 4
  LDI r6, 20
  LDI r0, BUF
  LDI r1, 0x00FFFF
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Query trace count (mode 0)
  LDI r3, 0
  TRACE_READ r3        ; r5 = count
  MOV r11, r5           ; save count
  CALL val_to_hex      ; convert r5 to HEX_BUF
  LDI r14, 110
  LDI r6, 20
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r3=index, r14=dest addr -> writes 20 words
  CMP r11, r7
  BLT r5, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r11, r7           ; r11 = count - 1 (last index)
  MOV r3, r11
  LDI r14, TRACE_RD
  LDI r13, 1
  TRACE_READ r13        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r14, 4
  LDI r6, 34
  LDI r0, BUF
  LDI r1, 0x00FF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, TRACE_RD
  ADD r20, r7
  ADD r20, r7           ; +2 = PC
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 70
  LDI r6, 34
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r14, 4
  LDI r6, 48
  LDI r0, BUF
  LDI r1, 0x00FF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 70
  LDI r6, 48
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Show register r5 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r5:"
  LDI r14, 4
  LDI r6, 62
  LDI r0, BUF
  LDI r1, 0x88FF88
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 28
  LDI r6, 62
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Show register r7 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r7:"
  LDI r14, 100
  LDI r6, 62
  LDI r0, BUF
  LDI r1, 0x88FF88
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 124
  LDI r6, 62
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r14, 4
  LDI r6, 34
  LDI r0, BUF
  LDI r1, 0x666666
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r14, 4
  LDI r6, 80
  LDI r0, BUF
  LDI r1, 0x00FF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r14, 4
  LDI r6, 94
  LDI r0, BUF
  LDI r1, 0x00FFFF
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, TICKS
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 52
  LDI r6, 94
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r14, 120
  LDI r6, 94
  LDI r0, BUF
  LDI r1, 0x00FFFF
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r20, FRAME_CNT
  LOAD r5, r20
  CALL val_to_hex
  LDI r14, 172
  LDI r6, 94
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r14, 4
  LDI r6, 112
  LDI r0, BUF
  LDI r1, 0xFF88FF
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Count FRAME opcodes (0x02) in trace
  LDI r3, 2            ; target opcode = FRAME
  LDI r13, 2
  TRACE_READ r13        ; mode 2: r5 = count of matching opcode
  MOV r11, r5
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r14, 4
  LDI r6, 126
  LDI r0, BUF
  LDI r1, 0x88FF88
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r14, 60
  LDI r6, 126
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Count IKEY opcodes (0x48)
  LDI r3, 0x48
  LDI r13, 2
  TRACE_READ r13
  MOV r11, r5
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r14, 110
  LDI r6, 126
  LDI r0, BUF
  LDI r1, 0x88FF88
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  LDI r14, 152
  LDI r6, 126
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r14, 4
  LDI r6, 146
  LDI r0, BUF
  LDI r1, 0xFFAA00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r14, 4
  LDI r6, 160
  LDI r0, BUF
  LDI r1, 0x88FF88
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; Show LR (r31) value
  MOV r5, r31
  CALL val_to_hex
  LDI r14, 160
  LDI r6, 160
  LDI r0, HEX_BUF
  LDI r1, 0xFFFF00
  LDI r15, 0x0A0A1E
  DRAWTEXT r14, r6, r0, r1, r15

  ; --- Status bar ---
  LDI r14, 0
  LDI r6, 236
  LDI r0, 256
  LDI r1, 20
  LDI r15, 0x1A1A2E
  RECTF r14, r6, r0, r1, r15

  ; Mode
  LDI r20, STEP_MODE
  LOAD r11, r20
  LDI r2, 0
  CMP r11, r2
  JZ r5, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r14, 4
  LDI r6, 238
  LDI r0, BUF
  LDI r1, 0xFF4444
  LDI r15, 0x1A1A2E
  DRAWTEXT r14, r6, r0, r1, r15
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r14, 4
  LDI r6, 238
  LDI r0, BUF
  LDI r1, 0x44FF44
  LDI r15, 0x1A1A2E
  DRAWTEXT r14, r6, r0, r1, r15

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r11, r20
  LDI r2, 0
  CMP r11, r2
  JZ r5, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r14, 70
  LDI r6, 238
  LDI r0, BUF
  LDI r1, 0x44FF44
  LDI r15, 0x1A1A2E
  DRAWTEXT r14, r6, r0, r1, r15
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r14, 70
  LDI r6, 238
  LDI r0, BUF
  LDI r1, 0x666666
  LDI r15, 0x1A1A2E
  DRAWTEXT r14, r6, r0, r1, r15

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r14, 140
  LDI r6, 238
  LDI r0, BUF
  LDI r1, 0x888888
  LDI r15, 0x1A1A2E
  DRAWTEXT r14, r6, r0, r1, r15

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r5 to 8-char hex string at HEX_BUF
; Clobbers r8-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r15, 1
  LDI r8, 0

vhex_loop:
  MOV r9, r5
  MOV r16, r22
  SHR r9, r16
  AND r9, r24

  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r8
  STORE r17, r16

  SUB r22, r23
  ADD r8, r15
  LDI r18, 8
  CMP r8, r18
  BLT r5, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r8
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
