; DESCRIPTION: Renders a yellow box of size 83x110 starting at (15, 111).
; PLAN: r0=15(x), r1=111(y), r2=83(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 111
LDI r2, 83
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
