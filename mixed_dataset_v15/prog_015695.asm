; DESCRIPTION: Places a green disk with center (130, 73) and radius 26.
; PLAN: r0=130(x), r1=73(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 73
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
