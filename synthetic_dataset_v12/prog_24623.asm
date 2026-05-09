; DESCRIPTION: Places a white circle of radius 57 at center (268, 144).
; PLAN: r0=268(x), r1=144(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 144
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
