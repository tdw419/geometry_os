; DESCRIPTION: Renders a red circular shape at (34, 123) with radius 27.
; PLAN: r0=34(x), r1=123(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 123
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
