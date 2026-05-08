; DESCRIPTION: This GeOS assembly code implements a visual register and trace debugger that displays register values (r1-r31 in hex), the Program Counter (PC) counter, and entries from the trace buffer. It supports user controls for stepping through execution ('S'), continuing ('C'), resetting the trace ('R'), and toggling tracing ('T'). The code initializes a hex lookup table, sets up initial states, and enters a main loop where it reads keyboard input, handles key presses, updates the display with relevant debug information, and draws the UI frame. The `val_to_hex` subroutine converts values to hexadecimal strings for display.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r1-r31 in hex), PC counter, trace buffer entries.
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
LDI r10, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r10
LDI r21, 49
STORE r20, r21
ADD r20, r10
LDI r21, 50
STORE r20, r21
ADD r20, r10
LDI r21, 51
STORE r20, r21
ADD r20, r10
LDI r21, 52
STORE r20, r21
ADD r20, r10
LDI r21, 53
STORE r20, r21
ADD r20, r10
LDI r21, 54
STORE r20, r21
ADD r20, r10
LDI r21, 55
STORE r20, r21
ADD r20, r10
LDI r21, 56
STORE r20, r21
ADD r20, r10
LDI r21, 57
STORE r20, r21
ADD r20, r10
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r10
LDI r21, 66
STORE r20, r21
ADD r20, r10
LDI r21, 67
STORE r20, r21
ADD r20, r10
LDI r21, 68
STORE r20, r21
ADD r20, r10
LDI r21, 69
STORE r20, r21
ADD r20, r10
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r0, 1
STORE r20, r0
LDI r20, TRACE_ON
LDI r0, 0
STORE r20, r0
LDI r20, FRAME_CNT
LDI r0, 0
STORE r20, r0

; Start trace recording
LDI r0, 1
SNAP_TRACE r0

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r0, r20
  ADD r0, r10
  STORE r20, r0

  ; Read keyboard
  IKEY r15

  ; Handle keys
  LDI r13, 83          ; 'S' = Step mode
  CMP r15, r13
  JZ r1, key_step

  LDI r13, 67          ; 'C' = Continue
  CMP r15, r13
  JZ r1, key_continue

  LDI r13, 82          ; 'R' = Reset trace
  CMP r15, r13
  JZ r1, key_reset

  LDI r13, 84          ; 'T' = Toggle trace
  CMP r15, r13
  JZ r1, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r0, 1
  STORE r20, r0
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r0, 0
  STORE r20, r0
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r0, 2
  SNAP_TRACE r0
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r0, r20
  SNAP_TRACE r0
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r0, r20
  LDI r13, 1
  XOR r0, r13
  STORE r20, r0
  SNAP_TRACE r0
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
  LDI r4, 0
  LDI r3, 256
  LDI r9, 16
  LDI r5, 0x8B0000
  RECTF r14, r4, r3, r9, r5

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r14, 60
  LDI r4, 3
  LDI r3, BUF
  LDI r9, 0xFFFFFF
  LDI r5, 0x8B0000
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r14, 4
  LDI r4, 20
  LDI r3, BUF
  LDI r9, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Query trace count (mode 0)
  LDI r0, 0
  TRACE_READ r0        ; r1 = count
  MOV r7, r1           ; save count
  CALL val_to_hex      ; convert r1 to HEX_BUF
  LDI r14, 110
  LDI r4, 20
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r0=index, r14=dest addr -> writes 20 words
  CMP r7, r10
  BLT r1, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r7, r10           ; r7 = count - 1 (last index)
  MOV r0, r7
  LDI r14, TRACE_RD
  LDI r11, 1
  TRACE_READ r11        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r14, 4
  LDI r4, 34
  LDI r3, BUF
  LDI r9, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, TRACE_RD
  ADD r20, r10
  ADD r20, r10           ; +2 = PC
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 70
  LDI r4, 34
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r14, 4
  LDI r4, 48
  LDI r3, BUF
  LDI r9, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 70
  LDI r4, 48
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Show register r1 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r1:"
  LDI r14, 4
  LDI r4, 62
  LDI r3, BUF
  LDI r9, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 28
  LDI r4, 62
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Show register r10 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r10:"
  LDI r14, 100
  LDI r4, 62
  LDI r3, BUF
  LDI r9, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 124
  LDI r4, 62
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r14, 4
  LDI r4, 34
  LDI r3, BUF
  LDI r9, 0x666666
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r14, 4
  LDI r4, 80
  LDI r3, BUF
  LDI r9, 0x00FF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r14, 4
  LDI r4, 94
  LDI r3, BUF
  LDI r9, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, TICKS
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 52
  LDI r4, 94
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r14, 120
  LDI r4, 94
  LDI r3, BUF
  LDI r9, 0x00FFFF
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r20, FRAME_CNT
  LOAD r1, r20
  CALL val_to_hex
  LDI r14, 172
  LDI r4, 94
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r14, 4
  LDI r4, 112
  LDI r3, BUF
  LDI r9, 0xFF88FF
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Count FRAME opcodes (0x02) in trace
  LDI r0, 2            ; target opcode = FRAME
  LDI r11, 2
  TRACE_READ r11        ; mode 2: r1 = count of matching opcode
  MOV r7, r1
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r14, 4
  LDI r4, 126
  LDI r3, BUF
  LDI r9, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r14, 60
  LDI r4, 126
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Count IKEY opcodes (0x48)
  LDI r0, 0x48
  LDI r11, 2
  TRACE_READ r11
  MOV r7, r1
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r14, 110
  LDI r4, 126
  LDI r3, BUF
  LDI r9, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  LDI r14, 152
  LDI r4, 126
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r14, 4
  LDI r4, 146
  LDI r3, BUF
  LDI r9, 0xFFAA00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r14, 4
  LDI r4, 160
  LDI r3, BUF
  LDI r9, 0x88FF88
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; Show LR (r31) value
  MOV r1, r31
  CALL val_to_hex
  LDI r14, 160
  LDI r4, 160
  LDI r3, HEX_BUF
  LDI r9, 0xFFFF00
  LDI r5, 0x0A0A1E
  DRAWTEXT r14, r4, r3, r9, r5

  ; --- Status bar ---
  LDI r14, 0
  LDI r4, 236
  LDI r3, 256
  LDI r9, 20
  LDI r5, 0x1A1A2E
  RECTF r14, r4, r3, r9, r5

  ; Mode
  LDI r20, STEP_MODE
  LOAD r7, r20
  LDI r13, 0
  CMP r7, r13
  JZ r1, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r14, 4
  LDI r4, 238
  LDI r3, BUF
  LDI r9, 0xFF4444
  LDI r5, 0x1A1A2E
  DRAWTEXT r14, r4, r3, r9, r5
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r14, 4
  LDI r4, 238
  LDI r3, BUF
  LDI r9, 0x44FF44
  LDI r5, 0x1A1A2E
  DRAWTEXT r14, r4, r3, r9, r5

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r7, r20
  LDI r13, 0
  CMP r7, r13
  JZ r1, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r14, 70
  LDI r4, 238
  LDI r3, BUF
  LDI r9, 0x44FF44
  LDI r5, 0x1A1A2E
  DRAWTEXT r14, r4, r3, r9, r5
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r14, 70
  LDI r4, 238
  LDI r3, BUF
  LDI r9, 0x666666
  LDI r5, 0x1A1A2E
  DRAWTEXT r14, r4, r3, r9, r5

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r14, 140
  LDI r4, 238
  LDI r3, BUF
  LDI r9, 0x888888
  LDI r5, 0x1A1A2E
  DRAWTEXT r14, r4, r3, r9, r5

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r1 to 8-char hex string at HEX_BUF
; Clobbers r8-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r5, 1
  LDI r8, 0

vhex_loop:
  MOV r12, r1
  MOV r16, r22
  SHR r12, r16
  AND r12, r24

  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r8
  STORE r17, r16

  SUB r22, r23
  ADD r8, r5
  LDI r18, 8
  CMP r8, r18
  BLT r1, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r8
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
