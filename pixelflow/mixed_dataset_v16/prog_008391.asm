; DESCRIPTION: Renders a orange disk with center (106, 157) and radius 16.
; PLAN: r0=106(x), r1=157(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 157
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
