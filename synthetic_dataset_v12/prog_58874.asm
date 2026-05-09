; DESCRIPTION: Renders a blue box of size 77x73 starting at (417, 138).
; PLAN: r0=417(x), r1=138(y), r2=77(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 138
LDI r2, 77
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
