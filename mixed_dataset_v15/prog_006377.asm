; DESCRIPTION: Composite: Draws a green circle centered at (213, 182) with radius 25 then Renders a red line between points (81, 225) and (137, 144) then Places a purple dot at position (435, 191).
; PLAN: r0=213(x), r1=182(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=225(y1), r7=137(x2), r8=144(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=191(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 182
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 225
LDI r7, 137
LDI r8, 144
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 191
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
