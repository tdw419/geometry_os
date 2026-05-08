; DESCRIPTION: This GeOS assembly code implements a visual register and trace debugger that displays register values (r14-r31 in hex), the Program Counter (PC) counter, and entries from the trace buffer. It supports user controls for stepping through execution ('S'), continuing ('C'), resetting the trace ('R'), and toggling tracing ('T'). The code initializes a hex lookup table, sets up initial states, and enters a main loop where it reads keyboard input, handles key presses, updates the display with relevant debug information, and draws the UI frame. The `val_to_hex` subroutine converts values to hexadecimal strings for display.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r14-r31 in hex), PC counter, trace buffer entries.
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
LDI r6, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r6
LDI r21, 49
STORE r20, r21
ADD r20, r6
LDI r21, 50
STORE r20, r21
ADD r20, r6
LDI r21, 51
STORE r20, r21
ADD r20, r6
LDI r21, 52
STORE r20, r21
ADD r20, r6
LDI r21, 53
STORE r20, r21
ADD r20, r6
LDI r21, 54
STORE r20, r21
ADD r20, r6
LDI r21, 55
STORE r20, r21
ADD r20, r6
LDI r21, 56
STORE r20, r21
ADD r20, r6
LDI r21, 57
STORE r20, r21
ADD r20, r6
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r6
LDI r21, 66
STORE r20, r21
ADD r20, r6
LDI r21, 67
STORE r20, r21
ADD r20, r6
LDI r21, 68
STORE r20, r21
ADD r20, r6
LDI r21, 69
STORE r20, r21
ADD r20, r6
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r5, 1
STORE r20, r5
LDI r20, TRACE_ON
LDI r5, 0
STORE r20, r5
LDI r20, FRAME_CNT
LDI r5, 0
STORE r20, r5

; Start trace recording
LDI r5, 1
SNAP_TRACE r5

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r5, r20
  ADD r5, r6
  STORE r20, r5

  ; Read keyboard
  IKEY r7

  ; Handle keys
  LDI r9, 83          ; 'S' = Step mode
  CMP r7, r9
  JZ r14, key_step

  LDI r9, 67          ; 'C' = Continue
  CMP r7, r9
  JZ r14, key_continue

  LDI r9, 82          ; 'R' = Reset trace
  CMP r7, r9
  JZ r14, key_reset

  LDI r9, 84          ; 'T' = Toggle trace
  CMP r7, r9
  JZ r14, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r5, 1
  STORE r20, r5
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r5, 0
  STORE r20, r5
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r5, 2
  SNAP_TRACE r5
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r5, r20
  SNAP_TRACE r5
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r5, r20
  LDI r9, 1
  XOR r5, r9
  STORE r20, r5
  SNAP_TRACE r5
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r13, 0x0A0A1E
  FILL r13

  ; Title bar
  LDI r13, 0
  LDI r3, 0
  LDI r0, 256
  LDI r8, 16
  LDI r12, 0x8B0000
  RECTF r13, r3, r0, r8, r12

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r13, 60
  LDI r3, 3
  LDI r0, BUF
  LDI r8, 0xFFFFFF
  LDI r12, 0x8B0000
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r13, 4
  LDI r3, 20
  LDI r0, BUF
  LDI r8, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Query trace count (mode 0)
  LDI r5, 0
  TRACE_READ r5        ; r14 = count
  MOV r10, r14           ; save count
  CALL val_to_hex      ; convert r14 to HEX_BUF
  LDI r13, 110
  LDI r3, 20
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r5=index, r13=dest addr -> writes 20 words
  CMP r10, r6
  BLT r14, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r10, r6           ; r10 = count - 1 (last index)
  MOV r5, r10
  LDI r13, TRACE_RD
  LDI r1, 1
  TRACE_READ r1        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r13, 4
  LDI r3, 34
  LDI r0, BUF
  LDI r8, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, TRACE_RD
  ADD r20, r6
  ADD r20, r6           ; +2 = PC
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 70
  LDI r3, 34
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r13, 4
  LDI r3, 48
  LDI r0, BUF
  LDI r8, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 70
  LDI r3, 48
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Show register r14 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r14:"
  LDI r13, 4
  LDI r3, 62
  LDI r0, BUF
  LDI r8, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 28
  LDI r3, 62
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Show register r6 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r6:"
  LDI r13, 100
  LDI r3, 62
  LDI r0, BUF
  LDI r8, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 124
  LDI r3, 62
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r13, 4
  LDI r3, 34
  LDI r0, BUF
  LDI r8, 0x666666
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r13, 4
  LDI r3, 80
  LDI r0, BUF
  LDI r8, 0x00FF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r13, 4
  LDI r3, 94
  LDI r0, BUF
  LDI r8, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, TICKS
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 52
  LDI r3, 94
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r13, 120
  LDI r3, 94
  LDI r0, BUF
  LDI r8, 0x00FFFF
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r20, FRAME_CNT
  LOAD r14, r20
  CALL val_to_hex
  LDI r13, 172
  LDI r3, 94
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r13, 4
  LDI r3, 112
  LDI r0, BUF
  LDI r8, 0xFF88FF
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Count FRAME opcodes (0x02) in trace
  LDI r5, 2            ; target opcode = FRAME
  LDI r1, 2
  TRACE_READ r1        ; mode 2: r14 = count of matching opcode
  MOV r10, r14
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r13, 4
  LDI r3, 126
  LDI r0, BUF
  LDI r8, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r13, 60
  LDI r3, 126
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Count IKEY opcodes (0x48)
  LDI r5, 0x48
  LDI r1, 2
  TRACE_READ r1
  MOV r10, r14
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r13, 110
  LDI r3, 126
  LDI r0, BUF
  LDI r8, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  LDI r13, 152
  LDI r3, 126
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r13, 4
  LDI r3, 146
  LDI r0, BUF
  LDI r8, 0xFFAA00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r13, 4
  LDI r3, 160
  LDI r0, BUF
  LDI r8, 0x88FF88
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; Show LR (r31) value
  MOV r14, r31
  CALL val_to_hex
  LDI r13, 160
  LDI r3, 160
  LDI r0, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r12, 0x0A0A1E
  DRAWTEXT r13, r3, r0, r8, r12

  ; --- Status bar ---
  LDI r13, 0
  LDI r3, 236
  LDI r0, 256
  LDI r8, 20
  LDI r12, 0x1A1A2E
  RECTF r13, r3, r0, r8, r12

  ; Mode
  LDI r20, STEP_MODE
  LOAD r10, r20
  LDI r9, 0
  CMP r10, r9
  JZ r14, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r13, 4
  LDI r3, 238
  LDI r0, BUF
  LDI r8, 0xFF4444
  LDI r12, 0x1A1A2E
  DRAWTEXT r13, r3, r0, r8, r12
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r13, 4
  LDI r3, 238
  LDI r0, BUF
  LDI r8, 0x44FF44
  LDI r12, 0x1A1A2E
  DRAWTEXT r13, r3, r0, r8, r12

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r10, r20
  LDI r9, 0
  CMP r10, r9
  JZ r14, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r13, 70
  LDI r3, 238
  LDI r0, BUF
  LDI r8, 0x44FF44
  LDI r12, 0x1A1A2E
  DRAWTEXT r13, r3, r0, r8, r12
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r13, 70
  LDI r3, 238
  LDI r0, BUF
  LDI r8, 0x666666
  LDI r12, 0x1A1A2E
  DRAWTEXT r13, r3, r0, r8, r12

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r13, 140
  LDI r3, 238
  LDI r0, BUF
  LDI r8, 0x888888
  LDI r12, 0x1A1A2E
  DRAWTEXT r13, r3, r0, r8, r12

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r14 to 8-char hex string at HEX_BUF
; Clobbers r15-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r12, 1
  LDI r15, 0

vhex_loop:
  MOV r11, r14
  MOV r16, r22
  SHR r11, r16
  AND r11, r24

  LDI r16, HEX_TABLE
  ADD r16, r11
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r15
  STORE r17, r16

  SUB r22, r23
  ADD r15, r12
  LDI r18, 8
  CMP r15, r18
  BLT r14, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r15
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
