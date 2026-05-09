; DESCRIPTION: Places a red circle of radius 22 at center (351, 166).
; PLAN: r0=351(x), r1=166(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 166
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
