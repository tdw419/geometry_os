; DESCRIPTION: Places a green disk with center (177, 81) and radius 14.
; PLAN: r0=177(x), r1=81(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 81
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
