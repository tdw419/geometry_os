; DESCRIPTION: Renders a magenta box of size 110x108 starting at (389, 124).
; PLAN: r0=389(x), r1=124(y), r2=110(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 124
LDI r2, 110
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
