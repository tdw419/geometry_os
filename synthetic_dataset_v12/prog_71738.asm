; DESCRIPTION: Places a cyan circle of radius 61 at center (120, 111).
; PLAN: r0=120(x), r1=111(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 111
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
