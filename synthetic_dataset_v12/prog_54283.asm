; DESCRIPTION: Renders a yellow box of size 28x80 starting at (233, 123).
; PLAN: r0=233(x), r1=123(y), r2=28(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 123
LDI r2, 28
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
