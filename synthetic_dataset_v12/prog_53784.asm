; DESCRIPTION: Composite: Places a purple circle of radius 78 at center (244, 159) then Draws a yellow line from (360, 178) to (23, 20).
; PLAN: r0=244(x), r1=159(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=178(y1), r7=23(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 159
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 178
LDI r7, 23
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
