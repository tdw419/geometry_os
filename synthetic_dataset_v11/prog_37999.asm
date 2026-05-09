; DESCRIPTION: Places a green circle of radius 17 at center (204, 111).
; PLAN: r0=204(x), r1=111(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 111
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
