; DESCRIPTION: Composite: Draws a yellow circle centered at (316, 114) with radius 80 then Draws a orange line from (340, 249) to (352, 183).
; PLAN: r0=316(x), r1=114(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x1), r6=249(y1), r7=352(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 114
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 249
LDI r7, 352
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
