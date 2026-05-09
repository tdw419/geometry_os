; DESCRIPTION: Renders a red disk with center (245, 61) and radius 21.
; PLAN: r0=245(x), r1=61(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 61
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
