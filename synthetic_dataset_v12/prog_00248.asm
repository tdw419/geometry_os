; DESCRIPTION: Composite: Renders a blue line between points (245, 154) and (412, 102) then Places a red circle of radius 67 at center (183, 142) then Creates a magenta rectangular region at (359, 174) spanning 59 by 25 pixels.
; PLAN: r0=245(x1), r1=154(y1), r2=412(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=142(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=174(y), r12=59(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 154
LDI r2, 412
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 142
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 174
LDI r12, 59
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
