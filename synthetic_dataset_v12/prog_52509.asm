; DESCRIPTION: Renders a yellow box of size 85x106 starting at (331, 128).
; PLAN: r0=331(x), r1=128(y), r2=85(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 128
LDI r2, 85
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
