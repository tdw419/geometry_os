; DESCRIPTION: Renders a orange disk with center (342, 193) and radius 29.
; PLAN: r0=342(x), r1=193(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 193
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
