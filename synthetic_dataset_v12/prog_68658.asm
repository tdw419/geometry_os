; DESCRIPTION: Places a green circle of radius 46 at center (149, 183).
; PLAN: r0=149(x), r1=183(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 183
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
