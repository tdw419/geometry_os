; DESCRIPTION: Places a purple circle of radius 27 at center (331, 111).
; PLAN: r0=331(x), r1=111(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 111
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
