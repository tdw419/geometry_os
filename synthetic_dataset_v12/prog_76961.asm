; DESCRIPTION: Renders a purple box of size 22x108 starting at (483, 2).
; PLAN: r0=483(x), r1=2(y), r2=22(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 2
LDI r2, 22
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
