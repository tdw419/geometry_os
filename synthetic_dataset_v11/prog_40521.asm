; DESCRIPTION: Renders a yellow box of size 60x62 starting at (191, 189).
; PLAN: r0=191(x), r1=189(y), r2=60(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 189
LDI r2, 60
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
