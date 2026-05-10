; DESCRIPTION: Creates a green circular shape at (196, 85) with radius 75.
; PLAN: r0=196(x), r1=85(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 85
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
