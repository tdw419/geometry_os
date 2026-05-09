; DESCRIPTION: Renders a yellow box of size 119x94 starting at (99, 27).
; PLAN: r0=99(x), r1=27(y), r2=119(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 27
LDI r2, 119
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
