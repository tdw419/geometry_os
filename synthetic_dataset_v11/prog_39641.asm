; DESCRIPTION: Draws a blue rectangle at (114, 209) with width 101 and height 44.
; PLAN: r0=114(x), r1=209(y), r2=101(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 209
LDI r2, 101
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
