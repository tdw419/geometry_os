; DESCRIPTION: Places a purple disk with center (229, 172) and radius 10.
; PLAN: r0=229(x), r1=172(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 172
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
