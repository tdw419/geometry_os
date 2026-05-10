; DESCRIPTION: Places a green disk with center (161, 172) and radius 61.
; PLAN: r0=161(x), r1=172(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 172
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
