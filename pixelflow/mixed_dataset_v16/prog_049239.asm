; DESCRIPTION: Composite: Draws a orange circle centered at (438, 190) with radius 59 then Places a magenta line segment connecting (117, 217) to (300, 85).
; PLAN: r0=438(x), r1=190(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=217(y1), r7=300(x2), r8=85(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 190
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 217
LDI r7, 300
LDI r8, 85
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
