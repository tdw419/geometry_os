; DESCRIPTION: Renders a yellow box of size 73x104 starting at (51, 71).
; PLAN: r0=51(x), r1=71(y), r2=73(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 71
LDI r2, 73
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
