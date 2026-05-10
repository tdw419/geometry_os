; DESCRIPTION: Renders a blue disk with center (245, 69) and radius 27.
; PLAN: r0=245(x), r1=69(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 69
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
