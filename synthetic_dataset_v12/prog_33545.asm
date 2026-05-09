; DESCRIPTION: Composite: Sets a single black pixel at (373, 246) then Renders a green line between points (462, 38) and (269, 111).
; PLAN: r0=373(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=38(y1), r7=269(x2), r8=111(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 462
LDI r6, 38
LDI r7, 269
LDI r8, 111
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
