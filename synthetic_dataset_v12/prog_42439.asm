; DESCRIPTION: Creates a blue circular shape at (398, 114) with radius 76.
; PLAN: r0=398(x), r1=114(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 114
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
