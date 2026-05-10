; DESCRIPTION: Composite: Places a purple 56x38 rectangle at position (269, 106) then Places a orange circle of radius 50 at center (292, 160) then Draws a orange line from (441, 156) to (383, 142).
; PLAN: r0=269(x), r1=106(y), r2=56(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=160(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x1), r11=156(y1), r12=383(x2), r13=142(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 106
LDI r2, 56
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 160
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 156
LDI r12, 383
LDI r13, 142
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
