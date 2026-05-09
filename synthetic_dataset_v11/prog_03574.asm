; DESCRIPTION: Renders a yellow box of size 115x22 starting at (87, 160).
; PLAN: r0=87(x), r1=160(y), r2=115(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 160
LDI r2, 115
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
