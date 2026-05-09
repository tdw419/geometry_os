; DESCRIPTION: Renders a yellow box of size 110x40 starting at (363, 111).
; PLAN: r0=363(x), r1=111(y), r2=110(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 111
LDI r2, 110
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
