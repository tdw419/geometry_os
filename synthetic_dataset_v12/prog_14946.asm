; DESCRIPTION: Places a green circle of radius 78 at center (103, 140).
; PLAN: r0=103(x), r1=140(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 140
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
