; DESCRIPTION: Draws a magenta rectangle at (133, 117) with width 71 and height 94.
; PLAN: r0=133(x), r1=117(y), r2=71(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 117
LDI r2, 71
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
