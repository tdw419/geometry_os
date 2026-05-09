; DESCRIPTION: Renders a purple box of size 18x57 starting at (321, 22).
; PLAN: r0=321(x), r1=22(y), r2=18(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 22
LDI r2, 18
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
