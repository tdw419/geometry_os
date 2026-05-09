; DESCRIPTION: Places a green circle of radius 22 at center (81, 40).
; PLAN: r0=81(x), r1=40(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 40
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
