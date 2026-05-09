; DESCRIPTION: Renders a blue box of size 79x35 starting at (89, 189).
; PLAN: r0=89(x), r1=189(y), r2=79(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 189
LDI r2, 79
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
