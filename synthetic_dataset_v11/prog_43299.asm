; DESCRIPTION: Renders a purple box of size 78x108 starting at (91, 22).
; PLAN: r0=91(x), r1=22(y), r2=78(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 22
LDI r2, 78
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
