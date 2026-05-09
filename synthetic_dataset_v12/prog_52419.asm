; DESCRIPTION: Renders a blue box of size 56x44 starting at (97, 119).
; PLAN: r0=97(x), r1=119(y), r2=56(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 119
LDI r2, 56
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
