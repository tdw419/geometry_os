; DESCRIPTION: Renders a orange disk with center (217, 221) and radius 35.
; PLAN: r0=217(x), r1=221(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 221
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
