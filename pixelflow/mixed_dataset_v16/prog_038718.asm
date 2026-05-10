; DESCRIPTION: Composite: Creates a magenta circular shape at (168, 200) with radius 49 then Draws a orange line from (169, 116) to (212, 117) then Sets a single purple pixel at (37, 2).
; PLAN: r0=168(x), r1=200(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x1), r6=116(y1), r7=212(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=2(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 200
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 116
LDI r7, 212
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 2
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
