; DESCRIPTION: Draws a magenta rectangle at (233, 36) with width 14 and height 30.
; PLAN: r0=233(x), r1=36(y), r2=14(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 36
LDI r2, 14
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
