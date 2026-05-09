; DESCRIPTION: Renders a orange disk with center (239, 195) and radius 56.
; PLAN: r0=239(x), r1=195(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 195
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
