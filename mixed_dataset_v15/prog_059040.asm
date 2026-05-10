; DESCRIPTION: Composite: Creates a yellow circular shape at (417, 119) with radius 75 then Draws a red line from (451, 100) to (103, 163) then Places a blue dot at position (294, 136).
; PLAN: r0=417(x), r1=119(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=100(y1), r7=103(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=136(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 119
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 100
LDI r7, 103
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 136
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
