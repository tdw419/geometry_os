; DESCRIPTION: Creates a red circular shape at (162, 104) with radius 24.
; PLAN: r0=162(x), r1=104(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 104
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
