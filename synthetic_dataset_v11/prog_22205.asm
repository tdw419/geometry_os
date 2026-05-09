; DESCRIPTION: Places a cyan circle of radius 10 at center (13, 216).
; PLAN: r0=13(x), r1=216(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 216
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
