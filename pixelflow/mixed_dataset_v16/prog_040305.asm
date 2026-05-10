; DESCRIPTION: Composite: Draws a white circle centered at (441, 100) with radius 45 then Sets a single magenta pixel at (38, 125) then Draws a orange line from (456, 41) to (203, 126).
; PLAN: r0=441(x), r1=100(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=125(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=456(x1), r11=41(y1), r12=203(x2), r13=126(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 100
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 125
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 41
LDI r12, 203
LDI r13, 126
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
