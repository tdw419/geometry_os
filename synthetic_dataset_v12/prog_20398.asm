; DESCRIPTION: Composite: Creates a yellow circular shape at (226, 28) with radius 19 then Sets a single white pixel at (243, 70) then Draws a orange line from (364, 11) to (136, 11).
; PLAN: r0=226(x), r1=28(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=70(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=364(x1), r11=11(y1), r12=136(x2), r13=11(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 28
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 70
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 364
LDI r11, 11
LDI r12, 136
LDI r13, 11
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
