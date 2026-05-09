; DESCRIPTION: Composite: Draws a orange line from (196, 245) to (300, 237) then Creates a green rectangular region at (294, 21) spanning 90 by 112 pixels then Draws a orange circle centered at (120, 55) with radius 19.
; PLAN: r0=196(x1), r1=245(y1), r2=300(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=21(y), r7=90(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=55(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 245
LDI r2, 300
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 21
LDI r7, 90
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 55
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
