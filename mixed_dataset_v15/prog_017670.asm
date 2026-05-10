; DESCRIPTION: Composite: Places a purple 113x86 rectangle at position (195, 76) then Draws a blue line from (283, 53) to (259, 68) then Renders a blue disk with center (325, 166) and radius 25.
; PLAN: r0=195(x), r1=76(y), r2=113(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=53(y1), r7=259(x2), r8=68(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=166(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 76
LDI r2, 113
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 53
LDI r7, 259
LDI r8, 68
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 166
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
