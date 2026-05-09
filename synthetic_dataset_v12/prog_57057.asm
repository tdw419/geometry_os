; DESCRIPTION: Renders a purple box of size 56x105 starting at (350, 34).
; PLAN: r0=350(x), r1=34(y), r2=56(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 34
LDI r2, 56
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
