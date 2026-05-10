; DESCRIPTION: Composite: Creates a orange circular shape at (257, 158) with radius 23 then Draws a green line from (289, 172) to (162, 70) then Places a red dot at position (73, 174).
; PLAN: r0=257(x), r1=158(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x1), r6=172(y1), r7=162(x2), r8=70(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=174(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 158
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 172
LDI r7, 162
LDI r8, 70
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 174
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
