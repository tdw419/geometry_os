; DESCRIPTION: Renders a blue box of size 11x31 starting at (216, 126).
; PLAN: r0=216(x), r1=126(y), r2=11(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 126
LDI r2, 11
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
