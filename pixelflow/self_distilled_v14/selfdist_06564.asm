; DESCRIPTION: Places a yellow disk with center (32, 13) and radius 28.
; PLAN: r0=32(x), r1=13(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 13
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
