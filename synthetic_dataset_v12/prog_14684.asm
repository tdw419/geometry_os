; DESCRIPTION: Creates a green circular shape at (193, 71) with radius 59.
; PLAN: r0=193(x), r1=71(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 71
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
