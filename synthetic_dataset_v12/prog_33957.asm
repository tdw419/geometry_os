; DESCRIPTION: Draws a magenta rectangle at (370, 61) with width 106 and height 82.
; PLAN: r0=370(x), r1=61(y), r2=106(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 61
LDI r2, 106
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
