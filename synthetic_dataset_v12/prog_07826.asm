; DESCRIPTION: Creates a red circular shape at (221, 162) with radius 77.
; PLAN: r0=221(x), r1=162(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 162
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
