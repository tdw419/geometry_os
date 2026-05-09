; DESCRIPTION: Renders a blue box of size 77x31 starting at (124, 109).
; PLAN: r0=124(x), r1=109(y), r2=77(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 109
LDI r2, 77
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
