; DESCRIPTION: Composite: Renders a green box of size 64x13 starting at (413, 48) then Draws a yellow circle centered at (224, 223) with radius 33 then Draws a black line from (248, 114) to (186, 59).
; PLAN: r0=413(x), r1=48(y), r2=64(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=223(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x1), r11=114(y1), r12=186(x2), r13=59(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 48
LDI r2, 64
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 223
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 114
LDI r12, 186
LDI r13, 59
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
