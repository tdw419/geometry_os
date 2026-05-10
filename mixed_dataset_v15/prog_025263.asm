; DESCRIPTION: Composite: Draws a yellow line from (266, 152) to (348, 72) then Sets a single cyan pixel at (236, 47) then Renders a purple disk with center (40, 97) and radius 34.
; PLAN: r0=266(x1), r1=152(y1), r2=348(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=40(x), r11=97(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 152
LDI r2, 348
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 40
LDI r11, 97
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
