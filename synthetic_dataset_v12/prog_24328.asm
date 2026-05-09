; DESCRIPTION: Composite: Places a green circle of radius 47 at center (241, 97) then Places a cyan line segment connecting (152, 123) to (200, 146) then Places a yellow dot at position (379, 110).
; PLAN: r0=241(x), r1=97(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=123(y1), r7=200(x2), r8=146(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=110(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 97
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 123
LDI r7, 200
LDI r8, 146
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 110
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
