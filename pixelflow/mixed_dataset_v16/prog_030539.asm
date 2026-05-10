; DESCRIPTION: Creates a green circular shape at (440, 50) with radius 45.
; PLAN: r0=440(x), r1=50(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 50
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
