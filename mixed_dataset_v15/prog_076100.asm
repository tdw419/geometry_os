; DESCRIPTION: Renders a orange disk with center (394, 195) and radius 17.
; PLAN: r0=394(x), r1=195(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 195
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
