; DESCRIPTION: Composite: Creates a black circular shape at (143, 79) with radius 63 then Draws a orange line from (395, 198) to (182, 175).
; PLAN: r0=143(x), r1=79(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=198(y1), r7=182(x2), r8=175(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 79
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 198
LDI r7, 182
LDI r8, 175
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
