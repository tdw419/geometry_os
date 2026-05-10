; DESCRIPTION: Composite: Creates a orange rectangular region at (303, 99) spanning 77 by 15 pixels then Draws a cyan line from (5, 43) to (471, 197) then Places a yellow circle of radius 23 at center (358, 99).
; PLAN: r0=303(x), r1=99(y), r2=77(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=43(y1), r7=471(x2), r8=197(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=99(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 99
LDI r2, 77
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 43
LDI r7, 471
LDI r8, 197
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 99
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
