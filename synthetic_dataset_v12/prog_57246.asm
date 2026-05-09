; DESCRIPTION: Creates a black circular shape at (317, 154) with radius 75.
; PLAN: r0=317(x), r1=154(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 154
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
