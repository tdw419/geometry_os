; DESCRIPTION: Composite: Draws a green line from (317, 58) to (225, 84) then Creates a orange circular shape at (194, 188) with radius 65.
; PLAN: r0=317(x1), r1=58(y1), r2=225(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=188(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 317
LDI r1, 58
LDI r2, 225
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 188
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
