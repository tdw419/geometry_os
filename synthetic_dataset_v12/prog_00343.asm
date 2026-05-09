; DESCRIPTION: Draws a magenta rectangle at (260, 93) with width 90 and height 62.
; PLAN: r0=260(x), r1=93(y), r2=90(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 93
LDI r2, 90
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
