; DESCRIPTION: Composite: Draws a orange circle centered at (384, 81) with radius 47 then Creates a green rectangular region at (208, 176) spanning 50 by 58 pixels then Renders a blue line between points (326, 73) and (467, 108).
; PLAN: r0=384(x), r1=81(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=176(y), r7=50(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=73(y1), r12=467(x2), r13=108(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 81
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 176
LDI r7, 50
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 73
LDI r12, 467
LDI r13, 108
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
