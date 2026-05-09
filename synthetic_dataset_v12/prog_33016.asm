; DESCRIPTION: Composite: Renders a purple disk with center (352, 144) and radius 77 then Creates a cyan rectangular region at (492, 17) spanning 11 by 66 pixels then Renders a purple line between points (258, 50) and (373, 20).
; PLAN: r0=352(x), r1=144(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=17(y), r7=11(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x1), r11=50(y1), r12=373(x2), r13=20(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 144
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 17
LDI r7, 11
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 50
LDI r12, 373
LDI r13, 20
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
