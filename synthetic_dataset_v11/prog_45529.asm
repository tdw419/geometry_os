; DESCRIPTION: Renders a green disk with center (203, 46) and radius 45.
; PLAN: r0=203(x), r1=46(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 46
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
