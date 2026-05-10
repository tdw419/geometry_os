; DESCRIPTION: Composite: Draws a purple circle centered at (178, 108) with radius 75 then Places a yellow line segment connecting (451, 180) to (220, 244).
; PLAN: r0=178(x), r1=108(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=180(y1), r7=220(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 108
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 180
LDI r7, 220
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
