; DESCRIPTION: Composite: Places a yellow dot at position (478, 251) then Creates a orange rectangular region at (367, 80) spanning 61 by 75 pixels then Places a yellow line segment connecting (442, 87) to (200, 65).
; PLAN: r0=478(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=80(y), r7=61(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=87(y1), r12=200(x2), r13=65(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 367
LDI r6, 80
LDI r7, 61
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 87
LDI r12, 200
LDI r13, 65
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
