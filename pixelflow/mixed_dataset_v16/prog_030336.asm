; DESCRIPTION: Renders a orange circular shape at (346, 191) with radius 71.
; PLAN: r0=346(x), r1=191(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 191
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
