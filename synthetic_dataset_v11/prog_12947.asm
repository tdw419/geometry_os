; DESCRIPTION: Renders a yellow box of size 20x78 starting at (123, 80).
; PLAN: r0=123(x), r1=80(y), r2=20(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 80
LDI r2, 20
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
