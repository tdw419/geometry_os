; DESCRIPTION: Creates a green circular shape at (205, 180) with radius 36.
; PLAN: r0=205(x), r1=180(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 180
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
