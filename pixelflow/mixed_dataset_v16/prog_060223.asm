; DESCRIPTION: Places a yellow disk with center (347, 67) and radius 57.
; PLAN: r0=347(x), r1=67(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 67
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
