; DESCRIPTION: Creates a red circular shape at (65, 162) with radius 52.
; PLAN: r0=65(x), r1=162(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 162
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
