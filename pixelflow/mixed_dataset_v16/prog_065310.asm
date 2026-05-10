; DESCRIPTION: Composite: Sets a single red pixel at (97, 29) then Creates a black rectangular region at (312, 120) spanning 24 by 75 pixels then Places a yellow circle of radius 12 at center (218, 81).
; PLAN: r0=97(x), r1=29(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=120(y), r7=24(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=81(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 29
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 120
LDI r7, 24
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 81
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
