; DESCRIPTION: Renders a orange disk with center (33, 213) and radius 10.
; PLAN: r0=33(x), r1=213(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 213
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
