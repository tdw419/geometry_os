; DESCRIPTION: Composite: Creates a white rectangular region at (29, 85) spanning 28 by 89 pixels then Places a black line segment connecting (312, 150) to (110, 201) then Places a cyan dot at position (148, 97).
; PLAN: r0=29(x), r1=85(y), r2=28(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=150(y1), r7=110(x2), r8=201(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=97(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 29
LDI r1, 85
LDI r2, 28
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 150
LDI r7, 110
LDI r8, 201
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 97
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
