; DESCRIPTION: Draws a magenta rectangle at (430, 71) with width 11 and height 77.
; PLAN: r0=430(x), r1=71(y), r2=11(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 71
LDI r2, 11
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
