; DESCRIPTION: Places a green circle of radius 56 at center (409, 95).
; PLAN: r0=409(x), r1=95(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 95
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
