; DESCRIPTION: Composite: Renders a black disk with center (442, 89) and radius 50 then Draws a red line from (402, 106) to (383, 33) then Sets a single cyan pixel at (61, 85).
; PLAN: r0=442(x), r1=89(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=106(y1), r7=383(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=85(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 89
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 106
LDI r7, 383
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 85
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
