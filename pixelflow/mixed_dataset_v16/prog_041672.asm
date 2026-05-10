; DESCRIPTION: Renders a orange disk with center (224, 138) and radius 51.
; PLAN: r0=224(x), r1=138(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 138
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
