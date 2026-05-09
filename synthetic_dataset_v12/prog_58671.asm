; DESCRIPTION: Composite: Draws a black line from (508, 206) to (298, 73) then Creates a blue rectangular region at (37, 166) spanning 14 by 25 pixels then Places a black circle of radius 37 at center (344, 171).
; PLAN: r0=508(x1), r1=206(y1), r2=298(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=166(y), r7=14(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=171(y), r12=37(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 206
LDI r2, 298
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 166
LDI r7, 14
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 171
LDI r12, 37
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
