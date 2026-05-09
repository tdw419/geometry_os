; DESCRIPTION: Renders a orange disk with center (172, 130) and radius 27.
; PLAN: r0=172(x), r1=130(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 130
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
