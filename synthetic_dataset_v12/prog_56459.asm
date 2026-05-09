; DESCRIPTION: Renders a magenta box of size 54x97 starting at (390, 39).
; PLAN: r0=390(x), r1=39(y), r2=54(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 39
LDI r2, 54
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
