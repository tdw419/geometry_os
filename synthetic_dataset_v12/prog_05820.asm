; DESCRIPTION: Renders a purple box of size 11x23 starting at (381, 176).
; PLAN: r0=381(x), r1=176(y), r2=11(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 176
LDI r2, 11
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
