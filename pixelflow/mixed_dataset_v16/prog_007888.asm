; DESCRIPTION: Composite: Renders a magenta box of size 19x49 starting at (402, 23) then Renders a blue disk with center (127, 79) and radius 75 then Draws a magenta line from (36, 127) to (419, 39).
; PLAN: r0=402(x), r1=23(y), r2=19(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=79(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=127(y1), r12=419(x2), r13=39(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 23
LDI r2, 19
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 79
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 127
LDI r12, 419
LDI r13, 39
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
