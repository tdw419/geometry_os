; DESCRIPTION: Composite: Sets a single orange pixel at (58, 170) then Draws a yellow line from (173, 111) to (224, 227) then Places a red circle of radius 20 at center (269, 82).
; PLAN: r0=58(x), r1=170(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=111(y1), r7=224(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=82(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 170
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 173
LDI r6, 111
LDI r7, 224
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 82
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
