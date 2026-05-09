; DESCRIPTION: Places a green circle of radius 55 at center (153, 76).
; PLAN: r0=153(x), r1=76(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 76
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
