; DESCRIPTION: Renders a yellow disk with center (375, 209) and radius 32.
; PLAN: r0=375(x), r1=209(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 209
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
