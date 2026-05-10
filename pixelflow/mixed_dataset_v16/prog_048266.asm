; DESCRIPTION: Creates a green circular shape at (394, 180) with radius 47.
; PLAN: r0=394(x), r1=180(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 180
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
