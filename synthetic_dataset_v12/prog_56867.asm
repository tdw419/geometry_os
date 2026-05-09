; DESCRIPTION: Renders a yellow box of size 109x119 starting at (219, 133).
; PLAN: r0=219(x), r1=133(y), r2=109(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 133
LDI r2, 109
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
