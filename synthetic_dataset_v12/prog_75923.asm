; DESCRIPTION: Composite: Renders a orange disk with center (207, 20) and radius 20 then Draws a black rectangle at (94, 1) with width 57 and height 75 then Draws a orange line from (361, 50) to (428, 144).
; PLAN: r0=207(x), r1=20(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=1(y), r7=57(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=361(x1), r11=50(y1), r12=428(x2), r13=144(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 20
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 1
LDI r7, 57
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 50
LDI r12, 428
LDI r13, 144
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
