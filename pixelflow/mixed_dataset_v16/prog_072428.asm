; DESCRIPTION: Composite: Draws a cyan circle centered at (417, 99) with radius 24 then Renders a orange line between points (15, 188) and (428, 119).
; PLAN: r0=417(x), r1=99(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x1), r6=188(y1), r7=428(x2), r8=119(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 99
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 188
LDI r7, 428
LDI r8, 119
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
