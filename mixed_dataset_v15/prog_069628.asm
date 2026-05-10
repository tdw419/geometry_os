; DESCRIPTION: Creates a green circular shape at (443, 104) with radius 65.
; PLAN: r0=443(x), r1=104(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 104
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
