; DESCRIPTION: Renders a black box of size 17x61 starting at (201, 92).
; PLAN: r0=201(x), r1=92(y), r2=17(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 92
LDI r2, 17
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
