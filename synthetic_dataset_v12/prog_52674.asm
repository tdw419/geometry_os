; DESCRIPTION: Places a green circle of radius 55 at center (361, 199).
; PLAN: r0=361(x), r1=199(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 199
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
