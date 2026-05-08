; DESCRIPTION: This GeOS assembly code implements a visual register and trace debugger that displays register values (r5-r31 in hex), the Program Counter (PC) counter, and entries from the trace buffer. It supports user controls for stepping through execution ('S'), continuing ('C'), resetting the trace ('R'), and toggling tracing ('T'). The code initializes a hex lookup table, sets up initial states, and enters a main loop where it reads keyboard input, handles key presses, updates the display with relevant debug information, and draws the UI frame. The `val_to_hex` subroutine converts values to hexadecimal strings for display.

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
LDI r11, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r11
LDI r21, 49
STORE r20, r21
ADD r20, r11
LDI r21, 50
STORE r20, r21
ADD r20, r11
LDI r21, 51
STORE r20, r21
ADD r20, r11
LDI r21, 52
STORE r20, r21
ADD r20, r11
LDI r21, 53
STORE r20, r21
ADD r20, r11
LDI r21, 54
STORE r20, r21
ADD r20, r11
LDI r21, 55
STORE r20, r21
ADD r20, r11
LDI r21, 56
STORE r20, r21
ADD r20, r11
LDI r21, 57
STORE r20, r21
ADD r20, r11
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r11
LDI r21, 66
STORE r20, r21
ADD r20, r11
LDI r21, 67
STORE r20, r21
ADD r20, r11
LDI r21, 68
STORE r20, r21
ADD r20, r11
LDI r21, 69
STORE r20, r21
ADD r20, r11
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
  ADD r3, r11
  STORE r20, r3

  ; Read keyboard
  IKEY r7

  ; Handle keys
  LDI r4, 83          ; 'S' = Step mode
  CMP r7, r4
  JZ r5, key_step

  LDI r4, 67          ; 'C' = Continue
  CMP r7, r4
  JZ r5, key_continue

  LDI r4, 82          ; 'R' = Reset trace
  CMP r7, r4
  JZ r5, key_reset

  LDI r4, 84          ; 'T' = Toggle trace
  CMP r7, r4
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
  LDI r4, 1
  XOR r3, r4
  STORE r20, r3
  SNAP_TRACE r3
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
  LDI r0, 0
  LDI r9, 256
  LDI r15, 16
  LDI r12, 0x8B0000
  RECTF r8, r0, r9, r15, r12

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r8, 60
  LDI r0, 3
  LDI r9, BUF
  LDI r15, 0xFFFFFF
  LDI r12, 0x8B0000
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r8, 4
  LDI r0, 20
  LDI r9, BUF
  LDI r15, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Query trace count (mode 0)
  LDI r3, 0
  TRACE_READ r3        ; r5 = count
  MOV r13, r5           ; save count
  CALL val_to_hex      ; convert r5 to HEX_BUF
  LDI r8, 110
  LDI r0, 20
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r3=index, r8=dest addr -> writes 20 words
  CMP r13, r11
  BLT r5, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r13, r11           ; r13 = count - 1 (last index)
  MOV r3, r13
  LDI r8, TRACE_RD
  LDI r10, 1
  TRACE_READ r10        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r8, 4
  LDI r0, 34
  LDI r9, BUF
  LDI r15, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, TRACE_RD
  ADD r20, r11
  ADD r20, r11           ; +2 = PC
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 70
  LDI r0, 34
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r8, 4
  LDI r0, 48
  LDI r9, BUF
  LDI r15, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 70
  LDI r0, 48
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Show register r5 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r5:"
  LDI r8, 4
  LDI r0, 62
  LDI r9, BUF
  LDI r15, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 28
  LDI r0, 62
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Show register r11 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r11:"
  LDI r8, 100
  LDI r0, 62
  LDI r9, BUF
  LDI r15, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 124
  LDI r0, 62
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r8, 4
  LDI r0, 34
  LDI r9, BUF
  LDI r15, 0x666666
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r8, 4
  LDI r0, 80
  LDI r9, BUF
  LDI r15, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r8, 4
  LDI r0, 94
  LDI r9, BUF
  LDI r15, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, TICKS
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 52
  LDI r0, 94
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r8, 120
  LDI r0, 94
  LDI r9, BUF
  LDI r15, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r20, FRAME_CNT
  LOAD r5, r20
  CALL val_to_hex
  LDI r8, 172
  LDI r0, 94
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r8, 4
  LDI r0, 112
  LDI r9, BUF
  LDI r15, 0xFF88FF
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Count FRAME opcodes (0x02) in trace
  LDI r3, 2            ; target opcode = FRAME
  LDI r10, 2
  TRACE_READ r10        ; mode 2: r5 = count of matching opcode
  MOV r13, r5
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r8, 4
  LDI r0, 126
  LDI r9, BUF
  LDI r15, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r8, 60
  LDI r0, 126
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Count IKEY opcodes (0x48)
  LDI r3, 0x48
  LDI r10, 2
  TRACE_READ r10
  MOV r13, r5
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r8, 110
  LDI r0, 126
  LDI r9, BUF
  LDI r15, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  LDI r8, 152
  LDI r0, 126
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r8, 4
  LDI r0, 146
  LDI r9, BUF
  LDI r15, 0xFFAA00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r8, 4
  LDI r0, 160
  LDI r9, BUF
  LDI r15, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; Show LR (r31) value
  MOV r5, r31
  CALL val_to_hex
  LDI r8, 160
  LDI r0, 160
  LDI r9, HEX_BUF
  LDI r15, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r8, r0, r9, r15, r12

  ; --- Status bar ---
  LDI r8, 0
  LDI r0, 236
  LDI r9, 256
  LDI r15, 20
  LDI r12, 0x1A1A2E
  RECTF r8, r0, r9, r15, r12

  ; Mode
  LDI r20, STEP_MODE
  LOAD r13, r20
  LDI r4, 0
  CMP r13, r4
  JZ r5, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r8, 4
  LDI r0, 238
  LDI r9, BUF
  LDI r15, 0xFF4444
  LDI r12, 0x1A1A2E
  DRAWTEXT r8, r0, r9, r15, r12
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r8, 4
  LDI r0, 238
  LDI r9, BUF
  LDI r15, 0x44FF44
  LDI r12, 0x1A1A2E
  DRAWTEXT r8, r0, r9, r15, r12

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r13, r20
  LDI r4, 0
  CMP r13, r4
  JZ r5, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r8, 70
  LDI r0, 238
  LDI r9, BUF
  LDI r15, 0x44FF44
  LDI r12, 0x1A1A2E
  DRAWTEXT r8, r0, r9, r15, r12
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r8, 70
  LDI r0, 238
  LDI r9, BUF
  LDI r15, 0x666666
  LDI r12, 0x1A1A2E
  DRAWTEXT r8, r0, r9, r15, r12

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r8, 140
  LDI r0, 238
  LDI r9, BUF
  LDI r15, 0x888888
  LDI r12, 0x1A1A2E
  DRAWTEXT r8, r0, r9, r15, r12

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r5 to 8-char hex string at HEX_BUF
; Clobbers r14-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r12, 1
  LDI r14, 0

vhex_loop:
  MOV r2, r5
  MOV r16, r22
  SHR r2, r16
  AND r2, r24

  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r14
  STORE r17, r16

  SUB r22, r23
  ADD r14, r12
  LDI r18, 8
  CMP r14, r18
  BLT r5, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r14
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
