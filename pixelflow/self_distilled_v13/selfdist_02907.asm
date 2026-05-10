; DESCRIPTION: Places a magenta disk with center (347, 30) and radius 61.
; PLAN: r0=347(x), r1=30(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 30
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
