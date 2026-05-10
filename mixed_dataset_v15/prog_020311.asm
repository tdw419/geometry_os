; DESCRIPTION: Renders a orange disk with center (118, 131) and radius 26.
; PLAN: r0=118(x), r1=131(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 131
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
