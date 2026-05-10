; DESCRIPTION: Composite: Draws a purple line from (433, 184) to (75, 110) then Draws a white rectangle at (273, 67) with width 11 and height 36 then Sets a single black pixel at (321, 77).
; PLAN: r0=433(x1), r1=184(y1), r2=75(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=67(y), r7=11(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x), r11=77(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 184
LDI r2, 75
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 67
LDI r7, 11
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 77
LDI r12, 0x000000
PSET r10, r11, r12
HALT
