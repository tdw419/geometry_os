; DESCRIPTION: Composite: Places a orange circle of radius 80 at center (237, 141) then Creates a orange rectangular region at (414, 43) spanning 54 by 42 pixels then Renders a blue line between points (451, 93) and (377, 253).
; PLAN: r0=237(x), r1=141(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=43(y), r7=54(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=93(y1), r12=377(x2), r13=253(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 141
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 43
LDI r7, 54
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 93
LDI r12, 377
LDI r13, 253
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
