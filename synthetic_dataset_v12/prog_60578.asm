; DESCRIPTION: Renders a purple box of size 56x101 starting at (250, 101).
; PLAN: r0=250(x), r1=101(y), r2=56(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 101
LDI r2, 56
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
