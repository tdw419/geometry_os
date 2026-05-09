; DESCRIPTION: Places a green circle of radius 75 at center (313, 136).
; PLAN: r0=313(x), r1=136(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 136
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
