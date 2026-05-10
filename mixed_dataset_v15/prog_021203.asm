; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (236, 111) then Creates a black rectangular region at (91, 175) spanning 83 by 63 pixels then Places a purple line segment connecting (107, 223) to (256, 141).
; PLAN: r0=236(x), r1=111(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=175(y), r7=83(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=223(y1), r12=256(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 111
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 175
LDI r7, 83
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 223
LDI r12, 256
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
