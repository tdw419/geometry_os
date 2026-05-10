; DESCRIPTION: Draws a yellow rectangle at (141, 22) with width 32 and height 21.
; PLAN: r0=141(x), r1=22(y), r2=32(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 22
LDI r2, 32
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
