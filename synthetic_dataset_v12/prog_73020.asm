; DESCRIPTION: Composite: Creates a purple rectangular region at (318, 40) spanning 16 by 57 pixels then Renders a green line between points (454, 58) and (153, 17).
; PLAN: r0=318(x), r1=40(y), r2=16(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=58(y1), r7=153(x2), r8=17(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 40
LDI r2, 16
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 58
LDI r7, 153
LDI r8, 17
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
