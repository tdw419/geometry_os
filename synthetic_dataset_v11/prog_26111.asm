; DESCRIPTION: Draws a magenta rectangle at (133, 8) with width 98 and height 57.
; PLAN: r0=133(x), r1=8(y), r2=98(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 8
LDI r2, 98
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
