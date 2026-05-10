; DESCRIPTION: Renders a yellow box of size 100x109 starting at (191, 133).
; PLAN: r0=191(x), r1=133(y), r2=100(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 133
LDI r2, 100
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
