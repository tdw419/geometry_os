; DESCRIPTION: Composite: Draws a green line from (491, 143) to (33, 52) then Draws a yellow circle centered at (293, 124) with radius 41 then Places a purple dot at position (82, 136).
; PLAN: r0=491(x1), r1=143(y1), r2=33(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=124(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=136(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 491
LDI r1, 143
LDI r2, 33
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 124
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 136
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
