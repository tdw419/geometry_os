; DESCRIPTION: Composite: Places a yellow dot at position (423, 255) then Draws a white circle centered at (325, 151) with radius 69 then Places a red line segment connecting (55, 61) to (261, 111).
; PLAN: r0=423(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=151(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x1), r11=61(y1), r12=261(x2), r13=111(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 325
LDI r6, 151
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 61
LDI r12, 261
LDI r13, 111
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
