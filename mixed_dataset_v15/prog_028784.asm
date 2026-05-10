; DESCRIPTION: Composite: Renders a red line between points (146, 100) and (284, 255) then Sets a single black pixel at (348, 20) then Draws a black rectangle at (190, 110) with width 65 and height 84.
; PLAN: r0=146(x1), r1=100(y1), r2=284(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=20(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=110(y), r12=65(width), r13=84(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 100
LDI r2, 284
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 20
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 190
LDI r11, 110
LDI r12, 65
LDI r13, 84
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
