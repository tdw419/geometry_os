; DESCRIPTION: Renders a purple box of size 56x46 starting at (144, 66).
; PLAN: r0=144(x), r1=66(y), r2=56(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 66
LDI r2, 56
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
