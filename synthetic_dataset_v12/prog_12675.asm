; DESCRIPTION: Composite: Sets a single black pixel at (14, 189) then Draws a cyan rectangle at (274, 145) with width 104 and height 26 then Renders a orange line between points (22, 190) and (248, 111).
; PLAN: r0=14(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=145(y), r7=104(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x1), r11=190(y1), r12=248(x2), r13=111(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 274
LDI r6, 145
LDI r7, 104
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 190
LDI r12, 248
LDI r13, 111
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
