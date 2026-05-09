; DESCRIPTION: Draws a yellow rectangle at (145, 11) with width 74 and height 57.
; PLAN: r0=145(x), r1=11(y), r2=74(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 11
LDI r2, 74
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
