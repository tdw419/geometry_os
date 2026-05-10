; DESCRIPTION: Places a green disk with center (226, 11) and radius 79.
; PLAN: r0=226(x), r1=11(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 11
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
