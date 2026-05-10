; DESCRIPTION: Composite: Draws a blue line from (391, 199) to (26, 222) then Draws a red circle centered at (72, 201) with radius 16.
; PLAN: r0=391(x1), r1=199(y1), r2=26(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=201(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 199
LDI r2, 26
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 201
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
