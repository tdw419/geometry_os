; DESCRIPTION: Creates a green circular shape at (382, 95) with radius 57.
; PLAN: r0=382(x), r1=95(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 95
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
