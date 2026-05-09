; DESCRIPTION: Renders a orange disk with center (362, 191) and radius 57.
; PLAN: r0=362(x), r1=191(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 191
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
