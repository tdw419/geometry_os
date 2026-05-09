; DESCRIPTION: Composite: Places a green circle of radius 13 at center (344, 240) then Draws a orange line from (395, 200) to (88, 214) then Places a green dot at position (202, 104).
; PLAN: r0=344(x), r1=240(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=200(y1), r7=88(x2), r8=214(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=104(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 240
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 200
LDI r7, 88
LDI r8, 214
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 104
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
