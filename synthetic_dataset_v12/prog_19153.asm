; DESCRIPTION: Composite: Renders a magenta disk with center (412, 171) and radius 54 then Draws a yellow rectangle at (283, 2) with width 89 and height 100 then Draws a magenta line from (152, 201) to (307, 109).
; PLAN: r0=412(x), r1=171(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=2(y), r7=89(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x1), r11=201(y1), r12=307(x2), r13=109(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 171
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 2
LDI r7, 89
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 201
LDI r12, 307
LDI r13, 109
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
