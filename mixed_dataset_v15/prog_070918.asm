; DESCRIPTION: Composite: Sets a single red pixel at (80, 97) then Creates a white rectangular region at (282, 132) spanning 15 by 106 pixels then Places a yellow circle of radius 13 at center (433, 50).
; PLAN: r0=80(x), r1=97(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=132(y), r7=15(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=50(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 97
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 282
LDI r6, 132
LDI r7, 15
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 50
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
