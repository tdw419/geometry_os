; DESCRIPTION: Draws a orange rectangle at (73, 138) with width 44 and height 75.
; PLAN: r0=73(x), r1=138(y), r2=44(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 138
LDI r2, 44
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
