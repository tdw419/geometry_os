; DESCRIPTION: Composite: Creates a orange circular shape at (248, 73) with radius 36 then Places a yellow line segment connecting (303, 254) to (159, 157) then Places a red dot at position (107, 252).
; PLAN: r0=248(x), r1=73(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=254(y1), r7=159(x2), r8=157(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=252(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 73
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 254
LDI r7, 159
LDI r8, 157
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 252
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
