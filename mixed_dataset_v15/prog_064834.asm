; DESCRIPTION: Renders a purple box of size 52x23 starting at (250, 11).
; PLAN: r0=250(x), r1=11(y), r2=52(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 11
LDI r2, 52
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
