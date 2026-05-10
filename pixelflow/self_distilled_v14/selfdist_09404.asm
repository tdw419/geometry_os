; DESCRIPTION: Places a blue disk with center (272, 172) and radius 75.
; PLAN: r0=272(x), r1=172(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 172
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
