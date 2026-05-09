; DESCRIPTION: Creates a green circular shape at (398, 139) with radius 55.
; PLAN: r0=398(x), r1=139(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 139
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
