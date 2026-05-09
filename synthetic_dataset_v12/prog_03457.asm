; DESCRIPTION: Creates a red circular shape at (433, 103) with radius 15.
; PLAN: r0=433(x), r1=103(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 103
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
