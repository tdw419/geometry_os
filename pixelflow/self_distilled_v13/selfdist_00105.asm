; DESCRIPTION: Places a green disk with center (241, 109) and radius 56.
; PLAN: r0=241(x), r1=109(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 109
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
