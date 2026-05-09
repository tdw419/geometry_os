; DESCRIPTION: Draws a magenta rectangle at (335, 82) with width 59 and height 97.
; PLAN: r0=335(x), r1=82(y), r2=59(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 82
LDI r2, 59
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
