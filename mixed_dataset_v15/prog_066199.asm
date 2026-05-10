; DESCRIPTION: Composite: Renders a white line between points (47, 153) and (314, 35) then Sets a single cyan pixel at (213, 226) then Creates a purple rectangular region at (13, 80) spanning 66 by 38 pixels.
; PLAN: r0=47(x1), r1=153(y1), r2=314(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=226(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=13(x), r11=80(y), r12=66(width), r13=38(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 153
LDI r2, 314
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 226
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 13
LDI r11, 80
LDI r12, 66
LDI r13, 38
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
