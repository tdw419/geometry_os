; DESCRIPTION: Places a green circle of radius 15 at center (286, 123).
; PLAN: r0=286(x), r1=123(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 123
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
