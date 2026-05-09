; DESCRIPTION: Draws a orange rectangle at (195, 162) with width 15 and height 92.
; PLAN: r0=195(x), r1=162(y), r2=15(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 162
LDI r2, 15
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
