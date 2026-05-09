; DESCRIPTION: Renders a black box of size 79x33 starting at (163, 181).
; PLAN: r0=163(x), r1=181(y), r2=79(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 181
LDI r2, 79
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
