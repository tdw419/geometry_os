; DESCRIPTION: Creates a white circular shape at (309, 50) with radius 36.
; PLAN: r0=309(x), r1=50(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 50
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
