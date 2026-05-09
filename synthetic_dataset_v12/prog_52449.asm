; DESCRIPTION: Composite: Draws a red circle centered at (222, 70) with radius 63 then Draws a black line from (62, 0) to (94, 93).
; PLAN: r0=222(x), r1=70(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=0(y1), r7=94(x2), r8=93(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 70
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 0
LDI r7, 94
LDI r8, 93
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
