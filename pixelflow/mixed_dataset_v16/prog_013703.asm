; DESCRIPTION: Renders a orange disk with center (241, 58) and radius 53.
; PLAN: r0=241(x), r1=58(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 58
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
