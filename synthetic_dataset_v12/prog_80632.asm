; DESCRIPTION: Draws a magenta rectangle at (260, 125) with width 71 and height 79.
; PLAN: r0=260(x), r1=125(y), r2=71(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 125
LDI r2, 71
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
