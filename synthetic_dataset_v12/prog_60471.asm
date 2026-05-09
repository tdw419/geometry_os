; DESCRIPTION: Draws a magenta rectangle at (200, 71) with width 12 and height 120.
; PLAN: r0=200(x), r1=71(y), r2=12(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 71
LDI r2, 12
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
