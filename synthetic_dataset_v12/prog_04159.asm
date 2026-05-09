; DESCRIPTION: Creates a blue circular shape at (352, 91) with radius 77.
; PLAN: r0=352(x), r1=91(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 91
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
