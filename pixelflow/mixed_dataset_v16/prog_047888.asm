; DESCRIPTION: Composite: Places a white dot at position (422, 28) then Creates a yellow circular shape at (149, 198) with radius 41 then Draws a red line from (146, 129) to (134, 137).
; PLAN: r0=422(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=198(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=129(y1), r12=134(x2), r13=137(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 198
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 129
LDI r12, 134
LDI r13, 137
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
