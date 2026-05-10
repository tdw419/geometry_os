; DESCRIPTION: Places a yellow disk with center (347, 95) and radius 80.
; PLAN: r0=347(x), r1=95(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 95
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
