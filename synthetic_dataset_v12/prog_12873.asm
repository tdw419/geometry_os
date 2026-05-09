; DESCRIPTION: Places a red circle of radius 19 at center (309, 104).
; PLAN: r0=309(x), r1=104(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 104
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
