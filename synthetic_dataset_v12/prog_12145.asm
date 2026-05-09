; DESCRIPTION: Draws a magenta rectangle at (335, 10) with width 59 and height 52.
; PLAN: r0=335(x), r1=10(y), r2=59(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 10
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
