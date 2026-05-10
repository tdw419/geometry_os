; DESCRIPTION: Composite: Places a yellow line segment connecting (232, 218) to (179, 94) then Renders a cyan disk with center (308, 154) and radius 78 then Places a purple dot at position (6, 200).
; PLAN: r0=232(x1), r1=218(y1), r2=179(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=154(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=200(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 218
LDI r2, 179
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 154
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 200
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
