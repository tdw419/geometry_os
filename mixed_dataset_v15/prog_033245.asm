; DESCRIPTION: Composite: Draws a orange circle centered at (379, 99) with radius 72 then Renders a orange line between points (298, 223) and (232, 126) then Places a orange dot at position (51, 205).
; PLAN: r0=379(x), r1=99(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=223(y1), r7=232(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=205(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 99
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 223
LDI r7, 232
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 205
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
