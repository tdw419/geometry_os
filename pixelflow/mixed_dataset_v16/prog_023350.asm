; DESCRIPTION: Places a white circle of radius 43 at center (91, 111).
; PLAN: r0=91(x), r1=111(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 111
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
