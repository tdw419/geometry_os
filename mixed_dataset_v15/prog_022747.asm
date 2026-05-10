; DESCRIPTION: Renders a yellow box of size 23x20 starting at (106, 170).
; PLAN: r0=106(x), r1=170(y), r2=23(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 170
LDI r2, 23
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
