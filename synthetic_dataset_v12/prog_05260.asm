; DESCRIPTION: Places a yellow circle of radius 20 at center (272, 216).
; PLAN: r0=272(x), r1=216(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 216
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
