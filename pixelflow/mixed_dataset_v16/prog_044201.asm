; DESCRIPTION: Composite: Creates a yellow rectangular region at (113, 127) spanning 27 by 54 pixels then Draws a magenta line from (264, 112) to (195, 141) then Renders a blue disk with center (67, 171) and radius 33.
; PLAN: r0=113(x), r1=127(y), r2=27(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x1), r6=112(y1), r7=195(x2), r8=141(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=171(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 127
LDI r2, 27
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 112
LDI r7, 195
LDI r8, 141
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 171
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
