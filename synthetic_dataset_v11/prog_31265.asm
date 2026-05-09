; DESCRIPTION: Renders a orange disk with center (131, 117) and radius 67.
; PLAN: r0=131(x), r1=117(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 117
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
