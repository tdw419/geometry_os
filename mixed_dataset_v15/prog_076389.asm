; DESCRIPTION: Draws a black rectangle at (162, 145) with width 115 and height 28.
; PLAN: r0=162(x), r1=145(y), r2=115(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 145
LDI r2, 115
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
