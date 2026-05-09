; DESCRIPTION: Composite: Draws a orange circle centered at (219, 100) with radius 79 then Draws a orange line from (4, 19) to (373, 187) then Places a red dot at position (63, 129).
; PLAN: r0=219(x), r1=100(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x1), r6=19(y1), r7=373(x2), r8=187(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=129(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 100
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 19
LDI r7, 373
LDI r8, 187
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 129
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
