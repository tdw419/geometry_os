; DESCRIPTION: Renders a blue box of size 109x19 starting at (234, 133).
; PLAN: r0=234(x), r1=133(y), r2=109(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 133
LDI r2, 109
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
