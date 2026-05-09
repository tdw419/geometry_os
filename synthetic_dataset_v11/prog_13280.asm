; DESCRIPTION: Renders a orange disk with center (178, 221) and radius 17.
; PLAN: r0=178(x), r1=221(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 221
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
