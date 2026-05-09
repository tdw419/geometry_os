; DESCRIPTION: Renders a orange disk with center (49, 141) and radius 32.
; PLAN: r0=49(x), r1=141(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 141
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
