; DESCRIPTION: Composite: Places a yellow line segment connecting (337, 216) to (367, 229) then Creates a yellow rectangular region at (360, 71) spanning 44 by 29 pixels then Renders a magenta disk with center (60, 204) and radius 29.
; PLAN: r0=337(x1), r1=216(y1), r2=367(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=71(y), r7=44(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x), r11=204(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 216
LDI r2, 367
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 71
LDI r7, 44
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 204
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
