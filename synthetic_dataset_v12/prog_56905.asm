; DESCRIPTION: Renders a black box of size 119x66 starting at (14, 124).
; PLAN: r0=14(x), r1=124(y), r2=119(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 124
LDI r2, 119
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
