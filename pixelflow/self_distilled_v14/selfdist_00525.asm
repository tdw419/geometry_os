; DESCRIPTION: Renders a green circular shape at (171, 23) with radius 27.
; PLAN: r0=171(x), r1=23(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 23
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
