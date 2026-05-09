; DESCRIPTION: Places a green circle of radius 21 at center (69, 230).
; PLAN: r0=69(x), r1=230(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 230
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
