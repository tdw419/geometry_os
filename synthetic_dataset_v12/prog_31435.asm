; DESCRIPTION: Draws a black rectangle at (181, 160) with width 80 and height 74.
; PLAN: r0=181(x), r1=160(y), r2=80(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 160
LDI r2, 80
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
