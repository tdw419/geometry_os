; DESCRIPTION: Composite: Places a red dot at position (146, 43) then Draws a magenta line from (155, 66) to (254, 217) then Renders a purple box of size 43x65 starting at (441, 149).
; PLAN: r0=146(x), r1=43(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x1), r6=66(y1), r7=254(x2), r8=217(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=149(y), r12=43(width), r13=65(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 43
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 66
LDI r7, 254
LDI r8, 217
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 149
LDI r12, 43
LDI r13, 65
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
