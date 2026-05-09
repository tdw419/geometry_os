; DESCRIPTION: Places a white circle of radius 57 at center (273, 186).
; PLAN: r0=273(x), r1=186(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 186
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
