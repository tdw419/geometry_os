; DESCRIPTION: Places a orange circle of radius 21 at center (343, 111).
; PLAN: r0=343(x), r1=111(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 111
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
