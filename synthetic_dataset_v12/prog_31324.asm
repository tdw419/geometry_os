; DESCRIPTION: Creates a red circular shape at (458, 90) with radius 10.
; PLAN: r0=458(x), r1=90(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 90
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
