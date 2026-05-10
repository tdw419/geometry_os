; DESCRIPTION: Creates a green circular shape at (209, 87) with radius 70.
; PLAN: r0=209(x), r1=87(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 87
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
