; DESCRIPTION: Renders a green disk with center (28, 52) and radius 24.
; PLAN: r0=28(x), r1=52(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 52
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
