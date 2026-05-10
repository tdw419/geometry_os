; DESCRIPTION: Composite: Draws a yellow circle centered at (303, 148) with radius 67 then Creates a green rectangular region at (224, 153) spanning 57 by 19 pixels then Places a magenta line segment connecting (320, 238) to (441, 91).
; PLAN: r0=303(x), r1=148(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=153(y), r7=57(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x1), r11=238(y1), r12=441(x2), r13=91(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 148
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 153
LDI r7, 57
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 238
LDI r12, 441
LDI r13, 91
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
