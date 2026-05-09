; DESCRIPTION: Renders a orange disk with center (449, 55) and radius 12.
; PLAN: r0=449(x), r1=55(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 55
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
