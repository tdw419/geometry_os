; DESCRIPTION: Creates a green circular shape at (273, 93) with radius 60.
; PLAN: r0=273(x), r1=93(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 93
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
