; DESCRIPTION: Places a purple circle of radius 10 at center (391, 107).
; PLAN: r0=391(x), r1=107(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 107
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
