; DESCRIPTION: Composite: Creates a white circular shape at (291, 178) with radius 13 then Draws a orange line from (105, 140) to (156, 253) then Sets a single yellow pixel at (68, 25).
; PLAN: r0=291(x), r1=178(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=140(y1), r7=156(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=25(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 178
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 140
LDI r7, 156
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 25
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
