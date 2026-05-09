; DESCRIPTION: Renders a orange disk with center (361, 130) and radius 46.
; PLAN: r0=361(x), r1=130(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 130
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
