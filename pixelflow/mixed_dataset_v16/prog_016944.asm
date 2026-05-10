; DESCRIPTION: Composite: Renders a green line between points (182, 197) and (103, 233) then Places a purple dot at position (238, 41) then Creates a black circular shape at (409, 112) with radius 77.
; PLAN: r0=182(x1), r1=197(y1), r2=103(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=41(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=112(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 197
LDI r2, 103
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 41
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 112
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
