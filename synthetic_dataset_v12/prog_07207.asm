; DESCRIPTION: Renders a orange disk with center (283, 210) and radius 28.
; PLAN: r0=283(x), r1=210(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 210
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
