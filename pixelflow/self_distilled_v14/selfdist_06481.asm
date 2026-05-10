; DESCRIPTION: Places a orange disk with center (326, 96) and radius 56.
; PLAN: r0=326(x), r1=96(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 96
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
