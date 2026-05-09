; DESCRIPTION: Places a green circle of radius 16 at center (261, 149).
; PLAN: r0=261(x), r1=149(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 149
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
