; DESCRIPTION: Renders a yellow disk with center (203, 159) and radius 50.
; PLAN: r0=203(x), r1=159(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 159
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
