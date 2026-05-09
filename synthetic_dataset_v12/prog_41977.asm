; DESCRIPTION: Draws a orange rectangle at (412, 81) with width 96 and height 79.
; PLAN: r0=412(x), r1=81(y), r2=96(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 81
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
