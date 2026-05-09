; DESCRIPTION: Composite: Places a red circle of radius 68 at center (145, 139) then Sets a single green pixel at (323, 241) then Creates a yellow rectangular region at (306, 154) spanning 120 by 20 pixels.
; PLAN: r0=145(x), r1=139(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=154(y), r12=120(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 139
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 154
LDI r12, 120
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
