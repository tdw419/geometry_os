; DESCRIPTION: Renders a black box of size 89x104 starting at (407, 124).
; PLAN: r0=407(x), r1=124(y), r2=89(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 124
LDI r2, 89
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
