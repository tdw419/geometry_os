; DESCRIPTION: Renders a purple box of size 77x22 starting at (37, 86).
; PLAN: r0=37(x), r1=86(y), r2=77(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 86
LDI r2, 77
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
