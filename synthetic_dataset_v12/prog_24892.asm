; DESCRIPTION: Renders a black box of size 66x33 starting at (322, 7).
; PLAN: r0=322(x), r1=7(y), r2=66(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 7
LDI r2, 66
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
