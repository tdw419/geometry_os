; DESCRIPTION: Renders a orange disk with center (96, 193) and radius 25.
; PLAN: r0=96(x), r1=193(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 193
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
