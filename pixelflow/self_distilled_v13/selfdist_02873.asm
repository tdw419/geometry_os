; DESCRIPTION: Renders a yellow circular shape at (203, 77) with radius 71.
; PLAN: r0=203(x), r1=77(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 77
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
