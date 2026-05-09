; DESCRIPTION: Draws a magenta rectangle at (193, 127) with width 68 and height 89.
; PLAN: r0=193(x), r1=127(y), r2=68(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 127
LDI r2, 68
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
