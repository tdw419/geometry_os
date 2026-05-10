; DESCRIPTION: Places a green circle of radius 46 at center (46, 181).
; PLAN: r0=46(x), r1=181(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 181
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
