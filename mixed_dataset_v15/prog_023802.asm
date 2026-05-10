; DESCRIPTION: Composite: Draws a green line from (92, 121) to (208, 223) then Renders a blue disk with center (94, 99) and radius 42 then Creates a orange rectangular region at (183, 60) spanning 105 by 24 pixels.
; PLAN: r0=92(x1), r1=121(y1), r2=208(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=99(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=60(y), r12=105(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 121
LDI r2, 208
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 99
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 60
LDI r12, 105
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
