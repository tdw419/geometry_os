; DESCRIPTION: Composite: Places a green dot at position (482, 110) then Draws a cyan line from (446, 175) to (146, 99) then Places a orange circle of radius 78 at center (188, 102).
; PLAN: r0=482(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=175(y1), r7=146(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=102(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 446
LDI r6, 175
LDI r7, 146
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 102
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
