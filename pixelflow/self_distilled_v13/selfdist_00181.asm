; DESCRIPTION: Renders a yellow circular shape at (245, 191) with radius 59.
; PLAN: r0=245(x), r1=191(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 191
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
