; DESCRIPTION: Places a white circle of radius 49 at center (273, 169).
; PLAN: r0=273(x), r1=169(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 169
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
