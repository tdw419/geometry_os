; DESCRIPTION: Renders a black box of size 116x108 starting at (388, 124).
; PLAN: r0=388(x), r1=124(y), r2=116(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 124
LDI r2, 116
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
