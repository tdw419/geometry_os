; DESCRIPTION: Places a green circle of radius 11 at center (110, 206).
; PLAN: r0=110(x), r1=206(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 206
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
