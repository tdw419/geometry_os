; DESCRIPTION: Composite: Creates a purple rectangular region at (419, 157) spanning 39 by 12 pixels then Places a purple circle of radius 19 at center (270, 113) then Draws a green line from (226, 54) to (188, 222).
; PLAN: r0=419(x), r1=157(y), r2=39(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=113(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x1), r11=54(y1), r12=188(x2), r13=222(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 157
LDI r2, 39
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 113
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 54
LDI r12, 188
LDI r13, 222
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
