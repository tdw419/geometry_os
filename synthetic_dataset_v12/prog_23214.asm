; DESCRIPTION: Draws a magenta rectangle at (83, 24) with width 90 and height 14.
; PLAN: r0=83(x), r1=24(y), r2=90(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 24
LDI r2, 90
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
