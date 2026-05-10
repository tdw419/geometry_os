; DESCRIPTION: Places a white disk with center (213, 87) and radius 75.
; PLAN: r0=213(x), r1=87(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 87
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
