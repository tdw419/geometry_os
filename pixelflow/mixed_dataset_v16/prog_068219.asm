; DESCRIPTION: Places a yellow disk with center (326, 52) and radius 16.
; PLAN: r0=326(x), r1=52(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 52
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
