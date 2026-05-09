; DESCRIPTION: Places a green circle of radius 46 at center (204, 74).
; PLAN: r0=204(x), r1=74(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 74
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
