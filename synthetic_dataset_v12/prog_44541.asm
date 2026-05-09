; DESCRIPTION: Renders a orange disk with center (447, 191) and radius 60.
; PLAN: r0=447(x), r1=191(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 191
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
