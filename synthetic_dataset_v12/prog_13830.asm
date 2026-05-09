; DESCRIPTION: Creates a black circular shape at (44, 180) with radius 16.
; PLAN: r0=44(x), r1=180(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 180
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
