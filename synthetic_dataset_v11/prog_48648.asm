; DESCRIPTION: Creates a green circular shape at (193, 109) with radius 50.
; PLAN: r0=193(x), r1=109(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 109
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
