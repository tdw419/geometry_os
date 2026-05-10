; DESCRIPTION: Places a green circle of radius 11 at center (471, 56).
; PLAN: r0=471(x), r1=56(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 56
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
