; DESCRIPTION: Composite: Renders a purple disk with center (383, 89) and radius 75 then Creates a magenta rectangular region at (210, 45) spanning 24 by 67 pixels then Renders a yellow line between points (59, 240) and (383, 3).
; PLAN: r0=383(x), r1=89(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=45(y), r7=24(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x1), r11=240(y1), r12=383(x2), r13=3(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 89
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 45
LDI r7, 24
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 240
LDI r12, 383
LDI r13, 3
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
