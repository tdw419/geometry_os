; DESCRIPTION: Renders a red circular shape at (97, 117) with radius 30.
; PLAN: r0=97(x), r1=117(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 117
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
