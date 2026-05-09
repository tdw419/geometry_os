; DESCRIPTION: Draws a orange rectangle at (28, 71) with width 73 and height 75.
; PLAN: r0=28(x), r1=71(y), r2=73(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 73
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
