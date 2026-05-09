; DESCRIPTION: Renders a magenta box of size 97x108 starting at (285, 76).
; PLAN: r0=285(x), r1=76(y), r2=97(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 76
LDI r2, 97
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
