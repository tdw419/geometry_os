; DESCRIPTION: Renders a orange disk with center (372, 134) and radius 60.
; PLAN: r0=372(x), r1=134(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 134
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
