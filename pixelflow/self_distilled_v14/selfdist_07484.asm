; DESCRIPTION: Places a purple disk with center (259, 159) and radius 61.
; PLAN: r0=259(x), r1=159(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 159
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
