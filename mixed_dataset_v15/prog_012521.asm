; DESCRIPTION: Creates a red circular shape at (373, 97) with radius 54.
; PLAN: r0=373(x), r1=97(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 97
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
