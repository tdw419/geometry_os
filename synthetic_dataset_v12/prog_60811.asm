; DESCRIPTION: Renders a yellow box of size 105x72 starting at (341, 23).
; PLAN: r0=341(x), r1=23(y), r2=105(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 23
LDI r2, 105
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
