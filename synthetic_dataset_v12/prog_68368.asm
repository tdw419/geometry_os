; DESCRIPTION: Composite: Places a red circle of radius 75 at center (160, 113) then Draws a black line from (508, 159) to (340, 27) then Places a yellow dot at position (407, 160).
; PLAN: r0=160(x), r1=113(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x1), r6=159(y1), r7=340(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=160(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 113
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 159
LDI r7, 340
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 160
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
