; DESCRIPTION: Places a green disk with center (322, 15) and radius 65.
; PLAN: r0=322(x), r1=15(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 15
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
