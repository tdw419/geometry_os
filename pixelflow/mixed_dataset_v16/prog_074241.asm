; DESCRIPTION: Places a green circle of radius 80 at center (213, 119).
; PLAN: r0=213(x), r1=119(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 119
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
