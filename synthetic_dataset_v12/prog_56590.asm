; DESCRIPTION: Creates a white circular shape at (258, 208) with radius 47.
; PLAN: r0=258(x), r1=208(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 208
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
