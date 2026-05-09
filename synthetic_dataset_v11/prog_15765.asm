; DESCRIPTION: Renders a orange disk with center (127, 130) and radius 79.
; PLAN: r0=127(x), r1=130(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 130
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
