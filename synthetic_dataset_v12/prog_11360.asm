; DESCRIPTION: Renders a yellow box of size 110x72 starting at (195, 141).
; PLAN: r0=195(x), r1=141(y), r2=110(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 141
LDI r2, 110
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
