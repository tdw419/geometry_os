; DESCRIPTION: Renders a yellow box of size 11x55 starting at (142, 185).
; PLAN: r0=142(x), r1=185(y), r2=11(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 185
LDI r2, 11
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
