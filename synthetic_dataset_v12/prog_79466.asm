; DESCRIPTION: Composite: Renders a orange disk with center (79, 41) and radius 40 then Sets a single cyan pixel at (71, 117) then Draws a white line from (402, 36) to (124, 172).
; PLAN: r0=79(x), r1=41(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=36(y1), r12=124(x2), r13=172(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 41
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 36
LDI r12, 124
LDI r13, 172
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
