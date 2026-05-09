; DESCRIPTION: Creates a green circular shape at (166, 180) with radius 76.
; PLAN: r0=166(x), r1=180(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 180
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
