; DESCRIPTION: Composite: Draws a orange line from (323, 198) to (405, 115) then Draws a white circle centered at (254, 115) with radius 54 then Places a purple dot at position (306, 200).
; PLAN: r0=323(x1), r1=198(y1), r2=405(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=115(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=200(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 198
LDI r2, 405
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 115
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 200
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
