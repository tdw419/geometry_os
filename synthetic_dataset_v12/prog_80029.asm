; DESCRIPTION: Places a yellow circle of radius 13 at center (393, 83).
; PLAN: r0=393(x), r1=83(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 83
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
