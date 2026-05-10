; DESCRIPTION: Composite: Draws a yellow circle centered at (352, 137) with radius 63 then Draws a black line from (381, 125) to (150, 254).
; PLAN: r0=352(x), r1=137(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x1), r6=125(y1), r7=150(x2), r8=254(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 137
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 125
LDI r7, 150
LDI r8, 254
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
