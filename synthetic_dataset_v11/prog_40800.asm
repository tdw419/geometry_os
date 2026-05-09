; DESCRIPTION: Draws a magenta rectangle at (91, 177) with width 66 and height 11.
; PLAN: r0=91(x), r1=177(y), r2=66(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 177
LDI r2, 66
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
