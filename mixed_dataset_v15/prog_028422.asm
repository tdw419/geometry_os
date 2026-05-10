; DESCRIPTION: Composite: Draws a orange circle centered at (340, 187) with radius 41 then Places a yellow dot at position (419, 88) then Draws a white line from (486, 153) to (329, 186).
; PLAN: r0=340(x), r1=187(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=486(x1), r11=153(y1), r12=329(x2), r13=186(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 187
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 486
LDI r11, 153
LDI r12, 329
LDI r13, 186
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
