; DESCRIPTION: Creates a green circular shape at (209, 180) with radius 39.
; PLAN: r0=209(x), r1=180(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 180
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
