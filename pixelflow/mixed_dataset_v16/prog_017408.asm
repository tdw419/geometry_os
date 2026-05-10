; DESCRIPTION: Renders a orange disk with center (436, 200) and radius 28.
; PLAN: r0=436(x), r1=200(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 200
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
