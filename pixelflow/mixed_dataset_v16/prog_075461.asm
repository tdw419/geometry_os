; DESCRIPTION: Composite: Renders a purple disk with center (324, 202) and radius 14 then Draws a cyan line from (479, 173) to (204, 201) then Sets a single blue pixel at (49, 4).
; PLAN: r0=324(x), r1=202(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=173(y1), r7=204(x2), r8=201(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=4(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 202
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 173
LDI r7, 204
LDI r8, 201
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 4
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
