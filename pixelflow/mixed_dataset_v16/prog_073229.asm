; DESCRIPTION: Composite: Places a green line segment connecting (319, 204) to (94, 12) then Creates a white rectangular region at (393, 169) spanning 15 by 39 pixels then Renders a blue disk with center (58, 168) and radius 51.
; PLAN: r0=319(x1), r1=204(y1), r2=94(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=169(y), r7=15(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x), r11=168(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 204
LDI r2, 94
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 169
LDI r7, 15
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 168
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
