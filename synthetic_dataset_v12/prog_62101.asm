; DESCRIPTION: Draws a red rectangle at (181, 110) with width 90 and height 117.
; PLAN: r0=181(x), r1=110(y), r2=90(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 110
LDI r2, 90
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
