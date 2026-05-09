; DESCRIPTION: Renders a yellow box of size 92x105 starting at (201, 18).
; PLAN: r0=201(x), r1=18(y), r2=92(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 18
LDI r2, 92
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
