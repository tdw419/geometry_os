; DESCRIPTION: Creates a white circular shape at (170, 149) with radius 71.
; PLAN: r0=170(x), r1=149(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 149
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
