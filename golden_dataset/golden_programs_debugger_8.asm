; DESCRIPTION: Display a object using color colored at the screen.

; debugger.asm -- Visual Register & Trace Debugger for Geometry OS
;
; Phase 76: Debugger UI
;
; Shows: register values (r15-r31 in hex), PC counter, trace buffer entries.
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
LDI r5, 1

; =========================================
; Init hex lookup table
; "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48           ; '0'
STORE r20, r21
ADD r20, r5
LDI r21, 49
STORE r20, r21
ADD r20, r5
LDI r21, 50
STORE r20, r21
ADD r20, r5
LDI r21, 51
STORE r20, r21
ADD r20, r5
LDI r21, 52
STORE r20, r21
ADD r20, r5
LDI r21, 53
STORE r20, r21
ADD r20, r5
LDI r21, 54
STORE r20, r21
ADD r20, r5
LDI r21, 55
STORE r20, r21
ADD r20, r5
LDI r21, 56
STORE r20, r21
ADD r20, r5
LDI r21, 57
STORE r20, r21
ADD r20, r5
LDI r21, 65           ; 'A'
STORE r20, r21
ADD r20, r5
LDI r21, 66
STORE r20, r21
ADD r20, r5
LDI r21, 67
STORE r20, r21
ADD r20, r5
LDI r21, 68
STORE r20, r21
ADD r20, r5
LDI r21, 69
STORE r20, r21
ADD r20, r5
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, STEP_MODE
LDI r12, 1
STORE r20, r12
LDI r20, TRACE_ON
LDI r12, 0
STORE r20, r12
LDI r20, FRAME_CNT
LDI r12, 0
STORE r20, r12

; Start trace recording
LDI r12, 1
SNAP_TRACE r12

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  ; Increment frame counter
  LDI r20, FRAME_CNT
  LOAD r12, r20
  ADD r12, r5
  STORE r20, r12

  ; Read keyboard
  IKEY r2

  ; Handle keys
  LDI r13, 83          ; 'S' = Step mode
  CMP r2, r13
  JZ r15, key_step

  LDI r13, 67          ; 'C' = Continue
  CMP r2, r13
  JZ r15, key_continue

  LDI r13, 82          ; 'R' = Reset trace
  CMP r2, r13
  JZ r15, key_reset

  LDI r13, 84          ; 'T' = Toggle trace
  CMP r2, r13
  JZ r15, key_trace

  JMP draw_frame

key_step:
  LDI r20, STEP_MODE
  LDI r12, 1
  STORE r20, r12
  JMP draw_frame

key_continue:
  LDI r20, STEP_MODE
  LDI r12, 0
  STORE r20, r12
  JMP draw_frame

key_reset:
  ; Clear trace
  LDI r12, 2
  SNAP_TRACE r12
  ; Re-enable
  LDI r20, TRACE_ON
  LOAD r12, r20
  SNAP_TRACE r12
  JMP draw_frame

key_trace:
  LDI r20, TRACE_ON
  LOAD r12, r20
  LDI r13, 1
  XOR r12, r13
  STORE r20, r12
  SNAP_TRACE r12
  JMP draw_frame

; =========================================
; DRAW FRAME
; =========================================
draw_frame:
  ; Background
  LDI r7, 0x0A0A1E
  FILL r7

  ; Title bar
  LDI r7, 0
  LDI r0, 0
  LDI r14, 256
  LDI r8, 16
  LDI r3, 0x8B0000
  RECTF r7, r0, r14, r8, r3

  ; Title
  LDI r20, BUF
  STRO r20, "GO Debugger"
  LDI r7, 60
  LDI r0, 3
  LDI r14, BUF
  LDI r8, 0xFFFFFF
  LDI r3, 0x8B0000
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Trace count ---
  LDI r20, BUF
  STRO r20, "Trace entries:"
  LDI r7, 4
  LDI r0, 20
  LDI r14, BUF
  LDI r8, 0x00FFFF
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Query trace count (mode 0)
  LDI r12, 0
  TRACE_READ r12        ; r15 = count
  MOV r10, r15           ; save count
  CALL val_to_hex      ; convert r15 to HEX_BUF
  LDI r7, 110
  LDI r0, 20
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Read last trace entry (PC + opcode) ---
  ; mode 1: r12=index, r7=dest addr -> writes 20 words
  CMP r10, r5
  BLT r15, no_trace_entries

  ; Read last entry (index = count - 1)
  SUB r10, r5           ; r10 = count - 1 (last index)
  MOV r12, r10
  LDI r7, TRACE_RD
  LDI r4, 1
  TRACE_READ r4        ; mode 1 read

  ; Show PC from trace entry: TRACE_RD+2 = PC
  LDI r20, BUF
  STRO r20, "Last PC:"
  LDI r7, 4
  LDI r0, 34
  LDI r14, BUF
  LDI r8, 0x00FF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, TRACE_RD
  ADD r20, r5
  ADD r20, r5           ; +2 = PC
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 70
  LDI r0, 34
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Show opcode from trace entry: TRACE_RD+19 = opcode
  LDI r20, BUF
  STRO r20, "Opcode:"
  LDI r7, 4
  LDI r0, 48
  LDI r14, BUF
  LDI r8, 0x00FF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, TRACE_RD
  LDI r21, 19
  ADD r20, r21
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 70
  LDI r0, 48
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Show register r15 from trace: TRACE_RD+3 = regs[0]
  LDI r20, BUF
  STRO r20, "r15:"
  LDI r7, 4
  LDI r0, 62
  LDI r14, BUF
  LDI r8, 0x88FF88
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, TRACE_RD
  LDI r21, 3
  ADD r20, r21
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 28
  LDI r0, 62
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Show register r5 from trace: TRACE_RD+4 = regs[1]
  LDI r20, BUF
  STRO r20, "r5:"
  LDI r7, 100
  LDI r0, 62
  LDI r14, BUF
  LDI r8, 0x88FF88
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, TRACE_RD
  LDI r21, 4
  ADD r20, r21
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 124
  LDI r0, 62
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  JMP show_stack

no_trace_entries:
  LDI r20, BUF
  STRO r20, "(no trace data)"
  LDI r7, 4
  LDI r0, 34
  LDI r14, BUF
  LDI r8, 0x666666
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

show_stack:
  ; --- Stack pointer (r30 = 0xFD00) ---
  LDI r20, BUF
  STRO r20, "SP: FD00"
  LDI r7, 4
  LDI r0, 80
  LDI r14, BUF
  LDI r8, 0x00FF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Step counter (TICKS) ---
  LDI r20, BUF
  STRO r20, "Ticks:"
  LDI r7, 4
  LDI r0, 94
  LDI r14, BUF
  LDI r8, 0x00FFFF
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, TICKS
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 52
  LDI r0, 94
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Frame counter ---
  LDI r20, BUF
  STRO r20, "Frame:"
  LDI r7, 120
  LDI r0, 94
  LDI r14, BUF
  LDI r8, 0x00FFFF
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r20, FRAME_CNT
  LOAD r15, r20
  CALL val_to_hex
  LDI r7, 172
  LDI r0, 94
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Opcode count from trace ---
  ; Count HALT opcodes (0x00) to prove TRACE_READ mode 2
  LDI r20, BUF
  STRO r20, "Opcode histogram:"
  LDI r7, 4
  LDI r0, 112
  LDI r14, BUF
  LDI r8, 0xFF88FF
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Count FRAME opcodes (0x02) in trace
  LDI r12, 2            ; target opcode = FRAME
  LDI r4, 2
  TRACE_READ r4        ; mode 2: r15 = count of matching opcode
  MOV r10, r15
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "FRAME:"
  LDI r7, 4
  LDI r0, 126
  LDI r14, BUF
  LDI r8, 0x88FF88
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r7, 60
  LDI r0, 126
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Count IKEY opcodes (0x48)
  LDI r12, 0x48
  LDI r4, 2
  TRACE_READ r4
  MOV r10, r15
  CALL val_to_hex
  LDI r20, BUF
  STRO r20, "IKEY:"
  LDI r7, 110
  LDI r0, 126
  LDI r14, BUF
  LDI r8, 0x88FF88
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  LDI r7, 152
  LDI r0, 126
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Register snapshot display ---
  LDI r20, BUF
  STRO r20, "-- Register Snapshot --"
  LDI r7, 4
  LDI r0, 146
  LDI r14, BUF
  LDI r8, 0xFFAA00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Show current live register values using RAM stores
  ; r30 = SP (we know it's 0xFD00)
  LDI r20, BUF
  STRO r20, "r30(SP):FD00 r31(LR):"
  LDI r7, 4
  LDI r0, 160
  LDI r14, BUF
  LDI r8, 0x88FF88
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; Show LR (r31) value
  MOV r15, r31
  CALL val_to_hex
  LDI r7, 160
  LDI r0, 160
  LDI r14, HEX_BUF
  LDI r8, 0xFFFF00
  LDI r3, 0x0A0A1E
  DRAWTEXT r7, r0, r14, r8, r3

  ; --- Status bar ---
  LDI r7, 0
  LDI r0, 236
  LDI r14, 256
  LDI r8, 20
  LDI r3, 0x1A1A2E
  RECTF r7, r0, r14, r8, r3

  ; Mode
  LDI r20, STEP_MODE
  LOAD r10, r20
  LDI r13, 0
  CMP r10, r13
  JZ r15, mode_run

  LDI r20, BUF
  STRO r20, "[STEP]"
  LDI r7, 4
  LDI r0, 238
  LDI r14, BUF
  LDI r8, 0xFF4444
  LDI r3, 0x1A1A2E
  DRAWTEXT r7, r0, r14, r8, r3
  JMP status_trace_bar

mode_run:
  LDI r20, BUF
  STRO r20, "[RUN]"
  LDI r7, 4
  LDI r0, 238
  LDI r14, BUF
  LDI r8, 0x44FF44
  LDI r3, 0x1A1A2E
  DRAWTEXT r7, r0, r14, r8, r3

status_trace_bar:
  LDI r20, TRACE_ON
  LOAD r10, r20
  LDI r13, 0
  CMP r10, r13
  JZ r15, trc_off

  LDI r20, BUF
  STRO r20, "TRC:ON"
  LDI r7, 70
  LDI r0, 238
  LDI r14, BUF
  LDI r8, 0x44FF44
  LDI r3, 0x1A1A2E
  DRAWTEXT r7, r0, r14, r8, r3
  JMP hints

trc_off:
  LDI r20, BUF
  STRO r20, "TRC:OFF"
  LDI r7, 70
  LDI r0, 238
  LDI r14, BUF
  LDI r8, 0x666666
  LDI r3, 0x1A1A2E
  DRAWTEXT r7, r0, r14, r8, r3

hints:
  LDI r20, BUF
  STRO r20, "S:Step C:Run R:Reset T:Trace"
  LDI r7, 140
  LDI r0, 238
  LDI r14, BUF
  LDI r8, 0x888888
  LDI r3, 0x1A1A2E
  DRAWTEXT r7, r0, r14, r8, r3

  FRAME
  JMP main_loop

; =========================================
; val_to_hex: Convert r15 to 8-char hex string at HEX_BUF
; Clobbers r6-r19
; =========================================
val_to_hex:
  PUSH r31
  LDI r20, HEX_BUF
  LDI r21, 8
  LDI r22, 28
  LDI r23, 4
  LDI r24, 0xF
  LDI r3, 1
  LDI r6, 0

vhex_loop:
  MOV r11, r15
  MOV r16, r22
  SHR r11, r16
  AND r11, r24

  LDI r16, HEX_TABLE
  ADD r16, r11
  LOAD r16, r16

  MOV r17, r20
  ADD r17, r6
  STORE r17, r16

  SUB r22, r23
  ADD r6, r3
  LDI r18, 8
  CMP r6, r18
  BLT r15, vhex_loop

  ; Null terminate
  MOV r17, r20
  ADD r17, r6
  LDI r18, 0
  STORE r17, r18

  POP r31
  RET
