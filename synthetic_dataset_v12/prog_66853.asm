; DESCRIPTION: Composite: Creates a black rectangular region at (186, 89) spanning 59 by 54 pixels then Renders a red line between points (356, 56) and (422, 204) then Renders a purple disk with center (102, 154) and radius 77.
; PLAN: r0=186(x), r1=89(y), r2=59(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=56(y1), r7=422(x2), r8=204(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=154(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 89
LDI r2, 59
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 56
LDI r7, 422
LDI r8, 204
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 154
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
