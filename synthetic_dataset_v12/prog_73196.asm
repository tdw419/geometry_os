; DESCRIPTION: Composite: Places a purple circle of radius 69 at center (136, 147) then Draws a green line from (316, 221) to (62, 111).
; PLAN: r0=136(x), r1=147(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=221(y1), r7=62(x2), r8=111(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 147
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 221
LDI r7, 62
LDI r8, 111
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
