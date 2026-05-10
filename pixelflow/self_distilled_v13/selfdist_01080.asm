; DESCRIPTION: Renders a yellow rectangular region spanning 89 by 13 at (185, 111).
; PLAN: r0=185(x), r1=111(y), r2=89(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 111
LDI r2, 89
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
