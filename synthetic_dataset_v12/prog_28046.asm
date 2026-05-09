; DESCRIPTION: Composite: Renders a purple disk with center (116, 71) and radius 21 then Draws a red line from (25, 66) to (310, 172) then Places a yellow dot at position (399, 147).
; PLAN: r0=116(x), r1=71(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=66(y1), r7=310(x2), r8=172(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=147(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 71
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 66
LDI r7, 310
LDI r8, 172
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 147
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
