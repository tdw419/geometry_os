; DESCRIPTION: Places a black circle of radius 70 at center (83, 111).
; PLAN: r0=83(x), r1=111(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 111
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
