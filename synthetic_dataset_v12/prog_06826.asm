; DESCRIPTION: Renders a yellow box of size 23x18 starting at (474, 200).
; PLAN: r0=474(x), r1=200(y), r2=23(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 200
LDI r2, 23
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
