; DESCRIPTION: Composite: Renders a yellow line between points (287, 198) and (508, 20) then Renders a white disk with center (438, 111) and radius 58 then Places a red dot at position (429, 25).
; PLAN: r0=287(x1), r1=198(y1), r2=508(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=111(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=25(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 198
LDI r2, 508
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 111
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 25
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
