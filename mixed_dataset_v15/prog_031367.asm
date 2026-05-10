; DESCRIPTION: Creates a green circular shape at (400, 178) with radius 38.
; PLAN: r0=400(x), r1=178(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 178
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
