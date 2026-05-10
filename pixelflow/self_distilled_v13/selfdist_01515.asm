; DESCRIPTION: Places a magenta disk with center (245, 128) and radius 45.
; PLAN: r0=245(x), r1=128(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 128
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
