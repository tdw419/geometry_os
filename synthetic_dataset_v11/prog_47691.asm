; DESCRIPTION: Renders a black box of size 11x11 starting at (31, 87).
; PLAN: r0=31(x), r1=87(y), r2=11(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 87
LDI r2, 11
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
