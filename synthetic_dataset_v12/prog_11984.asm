; DESCRIPTION: Composite: Draws a green rectangle at (70, 201) with width 83 and height 33 then Draws a orange line from (435, 9) to (301, 74) then Places a orange circle of radius 20 at center (229, 57).
; PLAN: r0=70(x), r1=201(y), r2=83(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=9(y1), r7=301(x2), r8=74(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=57(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 201
LDI r2, 83
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 9
LDI r7, 301
LDI r8, 74
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 57
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
