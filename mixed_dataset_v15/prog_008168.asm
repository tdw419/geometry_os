; DESCRIPTION: Composite: Draws a magenta line from (390, 170) to (460, 190) then Sets a single red pixel at (10, 198) then Places a white 99x18 rectangle at position (341, 216).
; PLAN: r0=390(x1), r1=170(y1), r2=460(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=216(y), r12=99(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 170
LDI r2, 460
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 341
LDI r11, 216
LDI r12, 99
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
