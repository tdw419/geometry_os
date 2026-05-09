; DESCRIPTION: Places a purple circle of radius 23 at center (386, 159).
; PLAN: r0=386(x), r1=159(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 159
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
