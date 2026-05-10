; DESCRIPTION: Places a red disk with center (334, 132) and radius 64.
; PLAN: r0=334(x), r1=132(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 132
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
