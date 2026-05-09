; DESCRIPTION: Places a green circle of radius 15 at center (256, 40).
; PLAN: r0=256(x), r1=40(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 40
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
