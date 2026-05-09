; DESCRIPTION: Draws a magenta rectangle at (83, 144) with width 108 and height 59.
; PLAN: r0=83(x), r1=144(y), r2=108(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 144
LDI r2, 108
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
