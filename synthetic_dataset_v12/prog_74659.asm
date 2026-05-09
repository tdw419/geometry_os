; DESCRIPTION: Composite: Creates a blue rectangular region at (302, 142) spanning 66 by 110 pixels then Places a purple dot at position (429, 225) then Draws a magenta line from (393, 3) to (287, 75).
; PLAN: r0=302(x), r1=142(y), r2=66(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=225(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=3(y1), r12=287(x2), r13=75(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 142
LDI r2, 66
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 225
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 3
LDI r12, 287
LDI r13, 75
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
