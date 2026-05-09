; DESCRIPTION: Renders a orange disk with center (117, 103) and radius 47.
; PLAN: r0=117(x), r1=103(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 103
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
