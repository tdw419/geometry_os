; DESCRIPTION: Renders a yellow box of size 89x70 starting at (273, 123).
; PLAN: r0=273(x), r1=123(y), r2=89(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 123
LDI r2, 89
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
