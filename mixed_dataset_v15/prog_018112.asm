; DESCRIPTION: Renders a orange disk with center (285, 166) and radius 50.
; PLAN: r0=285(x), r1=166(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 166
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
