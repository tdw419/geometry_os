; DESCRIPTION: Creates a green circular shape at (371, 162) with radius 79.
; PLAN: r0=371(x), r1=162(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 162
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
