; DESCRIPTION: Draws a orange rectangle at (240, 115) with width 106 and height 107.
; PLAN: r0=240(x), r1=115(y), r2=106(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 115
LDI r2, 106
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
