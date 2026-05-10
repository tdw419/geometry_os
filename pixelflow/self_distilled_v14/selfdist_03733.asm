; DESCRIPTION: Places a green disk with center (32, 51) and radius 21.
; PLAN: r0=32(x), r1=51(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 51
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
