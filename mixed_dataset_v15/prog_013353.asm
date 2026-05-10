; DESCRIPTION: Composite: Draws a red line from (203, 201) to (201, 46) then Creates a magenta rectangular region at (55, 57) spanning 96 by 69 pixels then Places a blue dot at position (170, 107).
; PLAN: r0=203(x1), r1=201(y1), r2=201(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=57(y), r7=96(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=107(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 201
LDI r2, 201
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 57
LDI r7, 96
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 107
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
