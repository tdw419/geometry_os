; DESCRIPTION: Draws a yellow rectangle at (36, 65) with width 19 and height 70.
; PLAN: r0=36(x), r1=65(y), r2=19(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 19
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
