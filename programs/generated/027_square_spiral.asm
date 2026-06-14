; 027_square_spiral.asm -- Rainbow square spiral from center using LINE
; Expanding square spiral: right, down, left, up, repeat with growing sides

; Black background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4

; r0 = cur_x, r1 = cur_y (start at center)
LDI r0, 128
LDI r1, 128

; r2 = segment length (starts at 2)
LDI r2, 2

; r10 = direction counter (0..3)
LDI r10, 0

; r11 = steps-in-pair counter (0..1, length grows every 2 segments)
LDI r11, 0

; r12 = total segments remaining
LDI r12, 48

; r13 = color index
LDI r13, 0

seg_loop:
  ; Pick color based on r13
  LDI r4, 0
  ADD r4, r13
  LDI r5, 3
  AND r4, r5         ; r4 = r13 & 3

  ; Jump to color selection
  JZ r4, c_red
  LDI r5, 1
  SUB r4, r5
  JZ r4, c_green
  SUB r4, r5
  JZ r4, c_blue
  ; 3 = magenta
  LDI r4, 0xFF00FF
  JMP do_dir

c_red:
  LDI r4, 0xFF2222
  JMP do_dir

c_green:
  LDI r4, 0x22FF22
  JMP do_dir

c_blue:
  LDI r4, 0x4488FF
  JMP do_dir

do_dir:
  ; r10 = direction (0=right, 1=down, 2=left, 3=up)
  ; r0 = cur_x, r1 = cur_y, r2 = segment length
  LDI r3, 0
  ADD r3, r10
  JZ r3, d_right

  LDI r5, 1
  SUB r3, r5
  JZ r3, d_down

  SUB r3, r5
  JZ r3, d_left

  ; direction 3 = up
  ; end_x = cur_x, end_y = cur_y - len
  LDI r3, 0
  ADD r3, r1
  SUB r3, r2
  LINE r0, r1, r0, r3, r4
  LDI r1, 0
  ADD r1, r3
  JMP next_seg

d_right:
  ; end_x = cur_x + len, end_y = cur_y
  LDI r3, 0
  ADD r3, r0
  ADD r3, r2
  LINE r0, r1, r3, r1, r4
  LDI r0, 0
  ADD r0, r3
  JMP next_seg

d_down:
  ; end_x = cur_x, end_y = cur_y + len
  LDI r3, 0
  ADD r3, r1
  ADD r3, r2
  LINE r0, r1, r0, r3, r4
  LDI r1, 0
  ADD r1, r3
  JMP next_seg

d_left:
  ; end_x = cur_x - len, end_y = cur_y
  LDI r3, 0
  ADD r3, r0
  SUB r3, r2
  LINE r0, r1, r3, r1, r4
  LDI r0, 0
  ADD r0, r3
  JMP next_seg

next_seg:
  ; Increment direction (mod 4)
  LDI r5, 1
  ADD r10, r5
  LDI r3, 4
  LDI r4, 0
  ADD r4, r10
  SUB r4, r3
  JNZ r4, no_wrap
  LDI r10, 0
no_wrap:

  ; Increment pair counter
  ADD r11, r5
  LDI r3, 2
  LDI r4, 0
  ADD r4, r11
  SUB r4, r3
  JNZ r4, no_grow
  LDI r11, 0
  ; Grow segment length
  ADD r2, r5
no_grow:

  ; Cycle color
  ADD r13, r5

  ; Decrement total segments
  SUB r12, r5
  JNZ r12, seg_loop

HALT
