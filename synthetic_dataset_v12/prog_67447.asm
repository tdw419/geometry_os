; DESCRIPTION: Renders a yellow box of size 81x70 starting at (192, 45).
; PLAN: r0=192(x), r1=45(y), r2=81(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 45
LDI r2, 81
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
