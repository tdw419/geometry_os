; DESCRIPTION: Creates a green circular shape at (59, 85) with radius 52.
; PLAN: r0=59(x), r1=85(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 85
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
