; DESCRIPTION: Composite: Draws a yellow line from (296, 41) to (71, 184) then Renders a purple disk with center (411, 77) and radius 29 then Places a yellow dot at position (27, 172).
; PLAN: r0=296(x1), r1=41(y1), r2=71(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=77(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=172(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 41
LDI r2, 71
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 77
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 172
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
