; DESCRIPTION: Creates a green circular shape at (398, 142) with radius 39.
; PLAN: r0=398(x), r1=142(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 142
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
