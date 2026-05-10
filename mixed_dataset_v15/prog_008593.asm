; DESCRIPTION: Places a white circle of radius 51 at center (224, 179).
; PLAN: r0=224(x), r1=179(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 179
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
