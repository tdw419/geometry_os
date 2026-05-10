; DESCRIPTION: Composite: Renders a yellow disk with center (174, 188) and radius 33 then Draws a black rectangle at (268, 137) with width 14 and height 112 then Places a magenta line segment connecting (506, 111) to (224, 93).
; PLAN: r0=174(x), r1=188(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=137(y), r7=14(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x1), r11=111(y1), r12=224(x2), r13=93(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 188
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 137
LDI r7, 14
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 111
LDI r12, 224
LDI r13, 93
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
