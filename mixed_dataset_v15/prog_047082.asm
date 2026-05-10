; DESCRIPTION: Composite: Draws a yellow line from (209, 54) to (308, 68) then Draws a purple circle centered at (409, 209) with radius 41 then Places a purple dot at position (510, 127).
; PLAN: r0=209(x1), r1=54(y1), r2=308(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=209(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=510(x), r11=127(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 54
LDI r2, 308
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 209
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 510
LDI r11, 127
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
