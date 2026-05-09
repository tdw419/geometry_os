; DESCRIPTION: Places a orange circle of radius 61 at center (141, 177).
; PLAN: r0=141(x), r1=177(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 177
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
