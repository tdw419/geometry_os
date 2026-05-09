; DESCRIPTION: Places a green circle of radius 22 at center (274, 135).
; PLAN: r0=274(x), r1=135(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 135
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
