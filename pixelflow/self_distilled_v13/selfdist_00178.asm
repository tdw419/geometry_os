; DESCRIPTION: Draws a magenta rectangle at (249, 47) with width 85 and height 98.
; PLAN: r0=249(x), r1=47(y), r2=85(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 47
LDI r2, 85
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
