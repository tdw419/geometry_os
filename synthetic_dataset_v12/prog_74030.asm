; DESCRIPTION: Renders a blue box of size 73x103 starting at (119, 133).
; PLAN: r0=119(x), r1=133(y), r2=73(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 133
LDI r2, 73
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
