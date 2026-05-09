; DESCRIPTION: Draws a magenta rectangle at (273, 117) with width 102 and height 66.
; PLAN: r0=273(x), r1=117(y), r2=102(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 117
LDI r2, 102
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
