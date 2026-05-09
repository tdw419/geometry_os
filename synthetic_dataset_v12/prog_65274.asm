; DESCRIPTION: Creates a red circular shape at (52, 190) with radius 46.
; PLAN: r0=52(x), r1=190(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 190
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
