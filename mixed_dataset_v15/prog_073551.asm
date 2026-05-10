; DESCRIPTION: Composite: Draws a blue rectangle at (317, 173) with width 34 and height 11 then Renders a magenta line between points (355, 162) and (277, 201) then Places a black dot at position (475, 4).
; PLAN: r0=317(x), r1=173(y), r2=34(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=162(y1), r7=277(x2), r8=201(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=475(x), r11=4(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 173
LDI r2, 34
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 162
LDI r7, 277
LDI r8, 201
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 4
LDI r12, 0x000000
PSET r10, r11, r12
HALT
