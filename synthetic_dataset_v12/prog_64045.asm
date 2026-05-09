; DESCRIPTION: Composite: Renders a cyan disk with center (266, 78) and radius 28 then Renders a cyan line between points (64, 188) and (427, 15) then Creates a green rectangular region at (55, 14) spanning 77 by 56 pixels.
; PLAN: r0=266(x), r1=78(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=188(y1), r7=427(x2), r8=15(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=14(y), r12=77(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 78
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 188
LDI r7, 427
LDI r8, 15
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 14
LDI r12, 77
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
