; DESCRIPTION: Renders a yellow box of size 12x24 starting at (94, 35).
; PLAN: r0=94(x), r1=35(y), r2=12(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 35
LDI r2, 12
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
