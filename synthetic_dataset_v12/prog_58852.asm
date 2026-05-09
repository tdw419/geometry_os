; DESCRIPTION: Places a black circle of radius 77 at center (367, 177).
; PLAN: r0=367(x), r1=177(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 177
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
