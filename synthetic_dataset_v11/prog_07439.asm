; DESCRIPTION: Places a white circle of radius 48 at center (54, 111).
; PLAN: r0=54(x), r1=111(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 111
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
