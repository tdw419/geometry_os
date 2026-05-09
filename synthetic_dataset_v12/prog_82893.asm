; DESCRIPTION: Renders a yellow box of size 80x33 starting at (334, 13).
; PLAN: r0=334(x), r1=13(y), r2=80(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 13
LDI r2, 80
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
