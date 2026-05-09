; DESCRIPTION: Composite: Draws a blue line from (384, 84) to (295, 181) then Creates a blue rectangular region at (362, 87) spanning 57 by 24 pixels then Renders a red disk with center (50, 74) and radius 50.
; PLAN: r0=384(x1), r1=84(y1), r2=295(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=87(y), r7=57(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=74(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 84
LDI r2, 295
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 87
LDI r7, 57
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 74
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
