; DESCRIPTION: Renders a orange disk with center (292, 64) and radius 44.
; PLAN: r0=292(x), r1=64(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 64
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
