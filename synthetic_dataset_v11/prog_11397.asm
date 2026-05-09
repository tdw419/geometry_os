; DESCRIPTION: Places a cyan circle of radius 10 at center (101, 111).
; PLAN: r0=101(x), r1=111(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 111
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
