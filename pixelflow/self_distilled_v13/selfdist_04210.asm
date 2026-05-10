; DESCRIPTION: Places a green disk with center (13, 151) and radius 61.
; PLAN: r0=13(x), r1=151(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 151
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
