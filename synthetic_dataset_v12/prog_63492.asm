; DESCRIPTION: Renders a purple box of size 44x119 starting at (91, 13).
; PLAN: r0=91(x), r1=13(y), r2=44(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 13
LDI r2, 44
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
