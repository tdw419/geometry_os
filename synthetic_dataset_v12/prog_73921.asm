; DESCRIPTION: Renders a orange disk with center (405, 210) and radius 12.
; PLAN: r0=405(x), r1=210(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 210
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
