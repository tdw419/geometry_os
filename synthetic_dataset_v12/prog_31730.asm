; DESCRIPTION: Places a green circle of radius 37 at center (361, 206).
; PLAN: r0=361(x), r1=206(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 206
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
