; DESCRIPTION: Composite: Creates a yellow circular shape at (416, 185) with radius 65 then Sets a single white pixel at (137, 24) then Renders a red line between points (339, 96) and (340, 200).
; PLAN: r0=416(x), r1=185(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=339(x1), r11=96(y1), r12=340(x2), r13=200(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 185
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 339
LDI r11, 96
LDI r12, 340
LDI r13, 200
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
