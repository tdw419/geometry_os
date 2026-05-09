; DESCRIPTION: Draws a yellow rectangle at (84, 184) with width 32 and height 68.
; PLAN: r0=84(x), r1=184(y), r2=32(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 184
LDI r2, 32
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
