; DESCRIPTION: Composite: Places a black dot at position (137, 248) then Renders a black line between points (340, 65) and (374, 98) then Creates a red circular shape at (197, 60) with radius 47.
; PLAN: r0=137(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=340(x1), r6=65(y1), r7=374(x2), r8=98(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=60(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 340
LDI r6, 65
LDI r7, 374
LDI r8, 98
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 60
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
