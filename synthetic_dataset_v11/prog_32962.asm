; DESCRIPTION: Renders a orange disk with center (237, 153) and radius 19.
; PLAN: r0=237(x), r1=153(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 153
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
