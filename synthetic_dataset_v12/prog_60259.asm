; DESCRIPTION: Composite: Places a white circle of radius 55 at center (449, 152) then Draws a orange line from (66, 47) to (473, 23) then Sets a single green pixel at (198, 106).
; PLAN: r0=449(x), r1=152(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=47(y1), r7=473(x2), r8=23(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=106(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 152
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 47
LDI r7, 473
LDI r8, 23
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 106
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
