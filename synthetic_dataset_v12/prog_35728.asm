; DESCRIPTION: Creates a green circular shape at (45, 134) with radius 16.
; PLAN: r0=45(x), r1=134(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 134
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
