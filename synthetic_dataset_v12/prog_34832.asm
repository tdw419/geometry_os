; DESCRIPTION: Draws a magenta rectangle at (246, 89) with width 27 and height 20.
; PLAN: r0=246(x), r1=89(y), r2=27(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 89
LDI r2, 27
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
