; DESCRIPTION: Creates a red circular shape at (90, 117) with radius 55.
; PLAN: r0=90(x), r1=117(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 117
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
