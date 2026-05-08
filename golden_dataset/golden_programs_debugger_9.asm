; DESCRIPTION: Draws a colored object at the screen with fixed size.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r6-r31 in hex), PC counter, trace buffer entries.
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
LDI r10, 1
STORE r20, r10
LDI r20, TRACE_ON
LDI r10, 0
STORE r20, r10
LDI r20, FRAME_CNT
LDI r10, 0
STORE r20, r10

; Start trace recording
LDI r10, 1
SNAP_TRACE r10

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r10, r20
  ADD r10, r7
  STORE r20, r10

  ; Read keyboard
  IKEY r0

  ; Handle keys
  LDI r15, 83          ; 'S' = Step mode
  CMP r0, r15
  JZ r6, key_step

  LDI r15, 67          ; 'C' = Continue
  CMP r0, r15
  JZ r6, key_continue

  LDI r15, 82          ; 'R' = Reset trace
  CMP r0, r15
  JZ r6, key_reset

  LDI r15, 84          ; 'T' = Toggle trace
  CMP r0, r15
  JZ r6, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r10, 1
  STORE r20, r10
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r10, 0
  STORE r20, r10
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r10, 2
  SNAP_TRACE r10
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r10, r20
  SNAP_TRACE r10
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r10, r20
  LDI r15, 1
  XOR r10, r15
  STORE r20, r10
  SNAP_TRACE r10
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r5, 0x0A0A1E
  FILL r5

  ; Title bar
  LDI r5, 0
  LDI r8, 0
  LDI r13, 256
  LDI r12, 16
  LDI r1, 0x8B0000
  RECTF r5, r8, r13, r12, r1

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r5, 60
  LDI r8, 3
  LDI r13, BUF
  LDI r12, 0xFFFFFF
  LDI r1, 0x8B0000
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r5, 4
  LDI r8, 20
  LDI r13, BUF
  LDI r12, 0x00FFFF
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Query trace count (mode 0)
  LDI r10, 0
  TRACE_READ r10        ; r6 = count
  MOV r4, r6           ; save count
  CALL val_to_hex      ; convert r6 to HEX_BUF
  LDI r5, 110
  LDI r8, 20
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r10=index, r5=dest addr -> writes 20 words
  CMP r4, r7
  BLT r6, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r4, r7           ; r4 = count - 1 (last index)
  MOV r10, r4
  LDI r5, TRACE_RD
  LDI r2, 1
  TRACE_READ r2        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r5, 4
  LDI r8, 34
  LDI r13, BUF
  LDI r12, 0x00FF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, TRACE_RD
  ADD r20, r7
  ADD r20, r7           ; +2 = PC
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 70
  LDI r8, 34
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r5, 4
  LDI r8, 48
  LDI r13, BUF
  LDI r12, 0x00FF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 70
  LDI r8, 48
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Show register r6 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r6:"
  LDI r5, 4
  LDI r8, 62
  LDI r13, BUF
  LDI r12, 0x88FF88
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 28
  LDI r8, 62
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Show register r7 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r7:"
  LDI r5, 100
  LDI r8, 62
  LDI r13, BUF
  LDI r12, 0x88FF88
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 124
  LDI r8, 62
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r5, 4
  LDI r8, 34
  LDI r13, BUF
  LDI r12, 0x666666
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r5, 4
  LDI r8, 80
  LDI r13, BUF
  LDI r12, 0x00FF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r5, 4
  LDI r8, 94
  LDI r13, BUF
  LDI r12, 0x00FFFF
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, TICKS
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 52
  LDI r8, 94
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r5, 120
  LDI r8, 94
  LDI r13, BUF
  LDI r12, 0x00FFFF
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r20, FRAME_CNT
  LOAD r6, r20
  CALL val_to_hex
  LDI r5, 172
  LDI r8, 94
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r5, 4
  LDI r8, 112
  LDI r13, BUF
  LDI r12, 0xFF88FF
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Count FRAME opcodes (0x02) in trace
  LDI r10, 2            ; target opcode = FRAME
  LDI r2, 2
  TRACE_READ r2        ; mode 2: r6 = count of matching opcode
  MOV r4, r6
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r5, 4
  LDI r8, 126
  LDI r13, BUF
  LDI r12, 0x88FF88
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r5, 60
  LDI r8, 126
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Count IKEY opcodes (0x48)
  LDI r10, 0x48
  LDI r2, 2
  TRACE_READ r2
  MOV r4, r6
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r5, 110
  LDI r8, 126
  LDI r13, BUF
  LDI r12, 0x88FF88
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  LDI r5, 152
  LDI r8, 126
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r5, 4
  LDI r8, 146
  LDI r13, BUF
  LDI r12, 0xFFAA00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r5, 4
  LDI r8, 160
  LDI r13, BUF
  LDI r12, 0x88FF88
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; Show LR (r31) value
  MOV r6, r31
  CALL val_to_hex
  LDI r5, 160
  LDI r8, 160
  LDI r13, HEX_BUF
  LDI r12, 0xFFFF00
  LDI r1, 0x0A0A1E
  DRAWTEXT r5, r8, r13, r12, r1

  ; --- Status bar ---
  LDI r5, 0
  LDI r8, 236
  LDI r13, 256
  LDI r12, 20
  LDI r1, 0x1A1A2E
  RECTF r5, r8, r13, r12, r1

  ; Mode
  LDI r20, STEP_MODE
  LOAD r4, r20
  LDI r15, 0
  CMP r4, r15
  JZ r6, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r5, 4
  LDI r8, 238
  LDI r13, BUF
  LDI r12, 0xFF4444
  LDI r1, 0x1A1A2E
  DRAWTEXT r5, r8, r13, r12, r1
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r5, 4
  LDI r8, 238
  LDI r13, BUF
  LDI r12, 0x44FF44
  LDI r1, 0x1A1A2E
  DRAWTEXT r5, r8, r13, r12, r1

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r4, r20
  LDI r15, 0
  CMP r4, r15
  JZ r6, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r5, 70
  LDI r8, 238
  LDI r13, BUF
  LDI r12, 0x44FF44
  LDI r1, 0x1A1A2E
  DRAWTEXT r5, r8, r13, r12, r1
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r5, 70
  LDI r8, 238
  LDI r13, BUF
  LDI r12, 0x666666
  LDI r1, 0x1A1A2E
  DRAWTEXT r5, r8, r13, r12, r1

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r5, 140
  LDI r8, 238
  LDI r13, BUF
  LDI r12, 0x888888
  LDI r1, 0x1A1A2E
  DRAWTEXT r5, r8, r13, r12, r1

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r6 to 8-char hex string at HEX_BUF
; Clobbers r9-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r1, 1
  LDI r9, 0

vhex_loop:
  MOV r11, r6
  MOV r16, r22
  SHR r11, r16
  AND r11, r24

  LDI r16, HEX_TABLE
  ADD r16, r11
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r9
  STORE r17, r16

  SUB r22, r23
  ADD r9, r1
  LDI r18, 8
  CMP r9, r18
  BLT r6, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r9
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
