; DESCRIPTION: Draws a orange rectangle at (453, 96) with width 34 and height 96.
; PLAN: r0=453(x), r1=96(y), r2=34(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 96
LDI r2, 34
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
