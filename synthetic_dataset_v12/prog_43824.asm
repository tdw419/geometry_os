; DESCRIPTION: Renders a yellow box of size 115x12 starting at (206, 99).
; PLAN: r0=206(x), r1=99(y), r2=115(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 99
LDI r2, 115
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
