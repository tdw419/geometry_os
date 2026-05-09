; DESCRIPTION: Renders a orange disk with center (32, 128) and radius 10.
; PLAN: r0=32(x), r1=128(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 128
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
