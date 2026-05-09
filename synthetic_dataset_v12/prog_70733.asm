; DESCRIPTION: Places a green circle of radius 48 at center (217, 145).
; PLAN: r0=217(x), r1=145(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 145
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
