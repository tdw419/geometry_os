; DESCRIPTION: Renders a yellow box of size 115x94 starting at (123, 128).
; PLAN: r0=123(x), r1=128(y), r2=115(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 128
LDI r2, 115
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
