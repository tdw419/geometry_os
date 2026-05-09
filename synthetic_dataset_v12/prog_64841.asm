; DESCRIPTION: Composite: Places a green circle of radius 24 at center (36, 27) then Creates a green rectangular region at (422, 15) spanning 39 by 77 pixels then Renders a purple line between points (127, 169) and (301, 141).
; PLAN: r0=36(x), r1=27(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=15(y), r7=39(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=169(y1), r12=301(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 27
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 15
LDI r7, 39
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 169
LDI r12, 301
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
