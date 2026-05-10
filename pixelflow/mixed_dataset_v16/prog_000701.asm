; DESCRIPTION: Composite: Draws a yellow circle centered at (451, 193) with radius 21 then Renders a cyan line between points (490, 74) and (418, 207).
; PLAN: r0=451(x), r1=193(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=74(y1), r7=418(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 193
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 74
LDI r7, 418
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
