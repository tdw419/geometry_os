; DESCRIPTION: Creates a green circular shape at (420, 171) with radius 71.
; PLAN: r0=420(x), r1=171(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 171
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
