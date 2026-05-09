; DESCRIPTION: Places a white circle of radius 58 at center (373, 186).
; PLAN: r0=373(x), r1=186(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 186
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
