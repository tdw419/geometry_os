; DESCRIPTION: Places a blue circle of radius 26 at center (444, 111).
; PLAN: r0=444(x), r1=111(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 111
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
