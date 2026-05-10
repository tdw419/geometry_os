; DESCRIPTION: Draws a magenta rectangle at (246, 142) with width 87 and height 95.
; PLAN: r0=246(x), r1=142(y), r2=87(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 142
LDI r2, 87
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
