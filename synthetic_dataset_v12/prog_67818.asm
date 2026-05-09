; DESCRIPTION: Composite: Places a magenta line segment connecting (127, 34) to (264, 218) then Sets a single purple pixel at (101, 32) then Draws a yellow rectangle at (144, 134) with width 49 and height 60.
; PLAN: r0=127(x1), r1=34(y1), r2=264(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=144(x), r11=134(y), r12=49(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 34
LDI r2, 264
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 134
LDI r12, 49
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
