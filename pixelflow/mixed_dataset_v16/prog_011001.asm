; DESCRIPTION: Composite: Draws a green circle centered at (337, 97) with radius 33 then Places a purple line segment connecting (395, 238) to (480, 8).
; PLAN: r0=337(x), r1=97(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=238(y1), r7=480(x2), r8=8(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 97
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 238
LDI r7, 480
LDI r8, 8
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
