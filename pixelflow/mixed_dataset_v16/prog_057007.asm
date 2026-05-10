; DESCRIPTION: Draws a yellow rectangle at (70, 123) with width 70 and height 64.
; PLAN: r0=70(x), r1=123(y), r2=70(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 123
LDI r2, 70
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
