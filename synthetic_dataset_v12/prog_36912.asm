; DESCRIPTION: Renders a orange disk with center (348, 138) and radius 46.
; PLAN: r0=348(x), r1=138(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 138
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
