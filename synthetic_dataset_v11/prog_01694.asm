; DESCRIPTION: Draws a magenta rectangle at (146, 169) with width 69 and height 85.
; PLAN: r0=146(x), r1=169(y), r2=69(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 169
LDI r2, 69
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
