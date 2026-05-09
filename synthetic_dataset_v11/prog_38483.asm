; DESCRIPTION: Renders a orange disk with center (171, 175) and radius 71.
; PLAN: r0=171(x), r1=175(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 175
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
