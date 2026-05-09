; DESCRIPTION: Places a white circle of radius 16 at center (373, 92).
; PLAN: r0=373(x), r1=92(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 92
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
