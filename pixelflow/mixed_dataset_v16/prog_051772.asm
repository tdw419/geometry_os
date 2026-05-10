; DESCRIPTION: Renders a orange disk with center (338, 120) and radius 32.
; PLAN: r0=338(x), r1=120(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 120
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
