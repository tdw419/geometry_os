; DESCRIPTION: Renders a green disk with center (280, 56) and radius 25.
; PLAN: r0=280(x), r1=56(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 56
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
