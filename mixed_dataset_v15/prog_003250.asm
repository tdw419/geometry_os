; DESCRIPTION: Places a red disk with center (283, 182) and radius 77.
; PLAN: r0=283(x), r1=182(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 182
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
