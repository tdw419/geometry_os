; DESCRIPTION: Places a green circle of radius 28 at center (191, 40).
; PLAN: r0=191(x), r1=40(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 40
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
