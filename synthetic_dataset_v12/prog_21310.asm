; DESCRIPTION: Composite: Renders a blue disk with center (423, 120) and radius 69 then Creates a orange rectangular region at (70, 47) spanning 86 by 93 pixels then Draws a magenta line from (263, 35) to (184, 251).
; PLAN: r0=423(x), r1=120(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=47(y), r7=86(width), r8=93(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x1), r11=35(y1), r12=184(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 120
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 47
LDI r7, 86
LDI r8, 93
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 35
LDI r12, 184
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
