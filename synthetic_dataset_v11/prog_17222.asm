; DESCRIPTION: Draws a orange rectangle at (80, 65) with width 40 and height 96.
; PLAN: r0=80(x), r1=65(y), r2=40(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 65
LDI r2, 40
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
