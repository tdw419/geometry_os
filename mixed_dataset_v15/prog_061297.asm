; DESCRIPTION: Renders a yellow box of size 57x21 starting at (119, 216).
; PLAN: r0=119(x), r1=216(y), r2=57(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 216
LDI r2, 57
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
