; DESCRIPTION: Renders a yellow box of size 52x49 starting at (99, 123).
; PLAN: r0=99(x), r1=123(y), r2=52(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 123
LDI r2, 52
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
