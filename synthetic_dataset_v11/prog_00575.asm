; DESCRIPTION: Creates a white circular shape at (90, 145) with radius 56.
; PLAN: r0=90(x), r1=145(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 145
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
