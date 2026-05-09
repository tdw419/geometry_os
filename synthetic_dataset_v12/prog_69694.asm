; DESCRIPTION: Renders a magenta box of size 97x110 starting at (359, 59).
; PLAN: r0=359(x), r1=59(y), r2=97(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 59
LDI r2, 97
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
