; DESCRIPTION: Places a white circle of radius 65 at center (224, 132).
; PLAN: r0=224(x), r1=132(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 132
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
