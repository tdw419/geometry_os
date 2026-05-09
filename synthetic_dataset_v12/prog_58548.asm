; DESCRIPTION: Creates a red circular shape at (420, 52) with radius 40.
; PLAN: r0=420(x), r1=52(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 52
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
