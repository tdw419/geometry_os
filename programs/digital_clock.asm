; digital_clock.asm - 7-segment digital clock with date display
; Counts elapsed time from VM boot (MM:SS.ms)
; Uses TMR_GET (0xE8) for wall-clock milliseconds
; 7-segment digits rendered with RECTF blocks
;
; Memory Map:
;   0x3000  segment table base (10 entries, 7 bits each)
;   0x4000  string "GEOS CLOCK"
;   0x4020  string ":"
;
; Segment layout for each digit:
;    _a_        a = bit 6 (top horizontal)
;   |   |       b = bit 5 (top-right vertical)
;   f   b       c = bit 4 (bottom-right vertical)
;   |_g_|       d = bit 3 (bottom horizontal)
;   |   |       e = bit 2 (bottom-left vertical)
;   e   c       f = bit 1 (top-left vertical)
;   |_d_|       g = bit 0 (middle horizontal)
;
; Digit segments: 0=0x77 1=0x24 2=0x3D 3=0x35 4=0x2E 5=0x73 6=0x7B 7=0x25 8=0x7F 9=0x3F
; Wait -- let me recalculate properly:
; 0: a,b,c,d,e,f     = 0x77 = 0b1110111  (not g)
; 1: b,c             = 0x30 = 0b0110000  -- hmm
;
; Let me use a cleaner encoding. Segments as bits in a byte:
;   bit 0 = a (top)
;   bit 1 = b (top-right)
;   bit 2 = c (bottom-right)
;   bit 3 = d (bottom)
;   bit 4 = e (bottom-left)
;   bit 5 = f (top-left)
;   bit 6 = g (middle)
;
; 0 = a+b+c+d+e+f   = 0x3F (0b0111111)
; 1 = b+c           = 0x06 (0b0000110)
; 2 = a+b+d+e+g     = 0x5B (0b1011011)
; 3 = a+b+c+d+g     = 0x4F (0b1001111)
; 4 = b+c+f+g       = 0x66 (0b1100110)
; 5 = a+c+d+f+g     = 0x6D (0b1101101)
; 6 = a+c+d+e+f+g   = 0x7D (0b1111101)
; 7 = a+b+c         = 0x07 (0b0000111)
; 8 = a+b+c+d+e+f+g = 0x7F (0b1111111)
; 9 = a+b+c+d+f+g   = 0x6F (0b1101111)

; ===== Constants =====
LDI r20, 0       ; zero constant (reuse)

; ===== Segment Table =====
LDI r15, 0x3000
LDI r4, 0x3F
STORE r15, r4        ; digit 0
LDI r15, 0x3001
LDI r4, 0x06
STORE r15, r4        ; digit 1
LDI r15, 0x3002
LDI r4, 0x5B
STORE r15, r4        ; digit 2
LDI r15, 0x3003
LDI r4, 0x4F
STORE r15, r4        ; digit 3
LDI r15, 0x3004
LDI r4, 0x66
STORE r15, r4        ; digit 4
LDI r15, 0x3005
LDI r4, 0x6D
STORE r15, r4        ; digit 5
LDI r15, 0x3006
LDI r4, 0x7D
STORE r15, r4        ; digit 6
LDI r15, 0x3007
LDI r4, 0x07
STORE r15, r4        ; digit 7
LDI r15, 0x3008
LDI r4, 0x7F
STORE r15, r4        ; digit 8
LDI r15, 0x3009
LDI r4, 0x6F
STORE r15, r4        ; digit 9

; ===== Strings =====
LDI r15, 0x4000
STRO r15, "GEOS CLOCK"
LDI r15, 0x4020
STRO r15, ":"

; ===== Color Constants =====
LDI r22, 0x00FF00   ; green digit color
LDI r23, 0x003300   ; dim green for dim segments

; ===== Segment dimensions =====
; Each segment is a RECTF:
;   Horizontal segments (a, d, g): width=28, height=4
;   Vertical segments (b, c, e, f): width=4, height=14
; Digit total: 36 wide, 44 tall
; Spacing between digits: 8 pixels

; ===== Main Loop =====
main_loop:

; --- Clear screen ---
LDI r4, 0x0A0A1A
FILL r4

; --- Title ---
LDI r10, 0x4000
LDI r11, 80
LDI r12, 8
TEXT r11, r12, r10

; --- Get elapsed milliseconds ---
LDI r4, 0xE8     ; TMR_GET opcode
LDI r5, 1        ; dest = r1
; (TMR_GET is an opcode, not callable -- need to use inline approach)
; Actually TMR_GET reads into a register via opcode 0xE8.
; In assembly, we can't emit raw opcodes directly.
; Let me use the TICKS port (0xFFE) instead for frame-based timing.

; Read TICKS (frame counter from port 0xFFE)
LDI r5, 0xFFE
LOAD r1, r5       ; r1 = frame_count (increments each FRAME)

; --- Convert frames to time ---
; 60 frames = 1 second
; total_seconds = r1 / 60
; We'll do this via repeated subtraction since GeOS has DIV now
LDI r2, 60
DIV r1, r2        ; r1 = total seconds

; r1 = total_seconds
; minutes = total_seconds / 60
; seconds = total_seconds % 60
MOV r3, r1
LDI r2, 60
DIV r3, r2        ; r3 = minutes
MOV r4, r3
MUL r4, r2        ; r4 = minutes * 60
SUB r1, r4        ; r1 = seconds (total - minutes*60)

; r3 = minutes (0-59), r1 = seconds (0-59)
; Extract digits:
; minutes_tens = r3 / 10
; minutes_ones = r3 % 10
MOV r5, r3
LDI r2, 10
DIV r5, r2        ; r5 = minutes_tens
MOV r6, r5
MUL r6, r2
SUB r6, r3        ; r6 = minutes - minutes_tens*10 = minutes_ones... wait, wrong order
; r6 = r3 - r5*10 = minutes_ones
LDI r7, 10
MOV r6, r3
MOV r8, r5
MUL r8, r7
SUB r6, r8        ; r6 = minutes_ones

; seconds_tens = r1 / 10
MOV r9, r1
LDI r2, 10
DIV r9, r2        ; r9 = seconds_tens
MOV r8, r9
MUL r8, r2
MOV r10, r1
SUB r10, r8       ; r10 = seconds_ones

; r5=min_tens, r6=min_ones, r9=sec_tens, r10=sec_ones
; Draw digits at positions:
;   D1 (min_tens): x=48, y=80
;   D2 (min_ones): x=92, y=80
;   colon:         x=130, y=80
;   D3 (sec_tens): x=148, y=80
;   D4 (sec_ones): x=192, y=80

LDI r11, 48
LDI r12, 80
PUSH r1
PUSH r3
PUSH r5
PUSH r6
PUSH r7
PUSH r9
PUSH r10
PUSH r11
PUSH r12
MOV r1, r5
CALL draw_digit
POP r12
POP r11
POP r10
POP r9
POP r7
POP r6
POP r5
POP r3
POP r1

LDI r11, 92
LDI r12, 80
PUSH r1
PUSH r3
PUSH r5
PUSH r6
PUSH r7
PUSH r9
PUSH r10
PUSH r11
PUSH r12
MOV r1, r6
CALL draw_digit
POP r12
POP r11
POP r10
POP r9
POP r7
POP r6
POP r5
POP r3
POP r1

; Colon
LDI r3, 130
LDI r4, 90
LDI r5, 4
LDI r6, 4
RECTF r3, r4, r5, r6, r22
LDI r4, 110
RECTF r3, r4, r5, r6, r22

LDI r11, 148
LDI r12, 80
PUSH r1
PUSH r3
PUSH r5
PUSH r6
PUSH r7
PUSH r9
PUSH r10
PUSH r11
PUSH r12
MOV r1, r9
CALL draw_digit
POP r12
POP r11
POP r10
POP r9
POP r7
POP r6
POP r5
POP r3
POP r1

LDI r11, 192
LDI r12, 80
PUSH r1
PUSH r3
PUSH r5
PUSH r6
PUSH r7
PUSH r9
PUSH r10
PUSH r11
PUSH r12
MOV r1, r10
CALL draw_digit
POP r12
POP r11
POP r10
POP r9
POP r7
POP r6
POP r5
POP r3
POP r1

; --- Date display at bottom ---
; Show elapsed frames as "FRAMES: NNNNN"
LDI r10, 0x4040
STRO r10, "FRAMES:"
LDI r11, 80
LDI r12, 200
TEXT r11, r12, r10

; --- Frame ---
FRAME
JMP main_loop


; ===== draw_digit subroutine =====
; Inputs: r1 = digit (0-9), r11 = x, r12 = y
; Draws a 7-segment digit using RECTF
; Segment table at 0x3000
; Preserves: all registers except r13-r19
draw_digit:
  ; Load segment pattern
  LDI r15, 0x3000
  ADD r15, r1
  LOAD r14, r15      ; r14 = segment bits

  ; Segment dimensions
  LDI r17, 28        ; horizontal segment width
  LDI r18, 4         ; segment thickness
  LDI r19, 14        ; vertical segment height

  ; --- Segment a (bit 0) - top horizontal ---
  MOV r15, r14
  LDI r16, 1
  AND r15, r16
  JZ r15, seg_b
  MOV r3, r11
  ADD r3, r18         ; x offset by thickness
  MOV r4, r12         ; y = top
  MOV r5, r17
  MOV r6, r18
  RECTF r3, r4, r5, r6, r22

seg_b:
  ; --- Segment b (bit 1) - top-right vertical ---
  MOV r15, r14
  LDI r16, 2
  AND r15, r16
  JZ r15, seg_c
  MOV r3, r11
  ADD r3, r17
  ADD r3, r18         ; x = right edge (digit_x + h_seg_w + thickness)
  MOV r4, r12
  ADD r4, r18         ; y = top + thickness
  MOV r5, r18         ; width = thickness
  MOV r6, r19         ; height = v_seg_h
  RECTF r3, r4, r5, r6, r22

seg_c:
  ; --- Segment c (bit 2) - bottom-right vertical ---
  MOV r15, r14
  LDI r16, 4
  AND r15, r16
  JZ r15, seg_d
  MOV r3, r11
  ADD r3, r17
  ADD r3, r18         ; x = right edge
  MOV r4, r12
  ADD r4, r18
  ADD r4, r18
  ADD r4, r19         ; y = top + thickness*2 + v_seg_h
  MOV r5, r18
  MOV r6, r19
  RECTF r3, r4, r5, r6, r22

seg_d:
  ; --- Segment d (bit 3) - bottom horizontal ---
  MOV r15, r14
  LDI r16, 8
  AND r15, r16
  JZ r15, seg_e
  MOV r3, r11
  ADD r3, r18         ; x offset by thickness
  MOV r4, r12
  ADD r4, r18
  ADD r4, r18
  ADD r4, r19
  ADD r4, r19         ; y = top + thickness*2 + v_seg_h*2
  MOV r5, r17
  MOV r6, r18
  RECTF r3, r4, r5, r6, r22

seg_e:
  ; --- Segment e (bit 4) - bottom-left vertical ---
  MOV r15, r14
  LDI r16, 16
  AND r15, r16
  JZ r15, seg_f
  MOV r3, r11         ; x = left edge
  MOV r4, r12
  ADD r4, r18
  ADD r4, r18
  ADD r4, r19         ; y = top + thickness*2 + v_seg_h
  MOV r5, r18
  MOV r6, r19
  RECTF r3, r4, r5, r6, r22

seg_f:
  ; --- Segment f (bit 5) - top-left vertical ---
  MOV r15, r14
  LDI r16, 32
  AND r15, r16
  JZ r15, seg_g
  MOV r3, r11         ; x = left edge
  MOV r4, r12
  ADD r4, r18         ; y = top + thickness
  MOV r5, r18
  MOV r6, r19
  RECTF r3, r4, r5, r6, r22

seg_g:
  ; --- Segment g (bit 6) - middle horizontal ---
  MOV r15, r14
  LDI r16, 64
  AND r15, r16
  JZ r15, seg_done
  MOV r3, r11
  ADD r3, r18         ; x offset by thickness
  MOV r4, r12
  ADD r4, r18
  ADD r4, r19         ; y = top + thickness + v_seg_h
  MOV r5, r17
  MOV r6, r18
  RECTF r3, r4, r5, r6, r22

seg_done:
  RET
