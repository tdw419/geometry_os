; DESCRIPTION: Composite: Creates a cyan rectangular region at (19, 146) spanning 52 by 91 pixels then Draws a purple line from (43, 97) to (419, 137) then Places a blue circle of radius 75 at center (190, 134).
; PLAN: r0=19(x), r1=146(y), r2=52(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x1), r6=97(y1), r7=419(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=134(y), r12=75(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 146
LDI r2, 52
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 97
LDI r7, 419
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 134
LDI r12, 75
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
