; DESCRIPTION: Places a white circle of radius 37 at center (217, 204).
; PLAN: r0=217(x), r1=204(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 204
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
