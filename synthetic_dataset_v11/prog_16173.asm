; DESCRIPTION: Draws a orange rectangle at (116, 87) with width 51 and height 96.
; PLAN: r0=116(x), r1=87(y), r2=51(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 87
LDI r2, 51
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
