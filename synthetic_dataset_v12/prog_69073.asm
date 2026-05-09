; DESCRIPTION: Creates a green circular shape at (428, 30) with radius 13.
; PLAN: r0=428(x), r1=30(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 30
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
