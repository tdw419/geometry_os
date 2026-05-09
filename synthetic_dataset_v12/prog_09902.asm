; DESCRIPTION: Composite: Places a purple circle of radius 64 at center (87, 182) then Places a magenta 18x52 rectangle at position (198, 118) then Draws a magenta line from (238, 113) to (347, 90).
; PLAN: r0=87(x), r1=182(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=118(y), r7=18(width), r8=52(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x1), r11=113(y1), r12=347(x2), r13=90(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 182
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 118
LDI r7, 18
LDI r8, 52
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 113
LDI r12, 347
LDI r13, 90
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
