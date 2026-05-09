; DESCRIPTION: Renders a orange disk with center (164, 214) and radius 38.
; PLAN: r0=164(x), r1=214(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 214
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
