; DESCRIPTION: Draws a yellow rectangle at (170, 8) with width 32 and height 84.
; PLAN: r0=170(x), r1=8(y), r2=32(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 8
LDI r2, 32
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
