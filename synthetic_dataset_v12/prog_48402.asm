; DESCRIPTION: Composite: Places a red circle of radius 63 at center (393, 119) then Renders a cyan line between points (90, 122) and (463, 91) then Sets a single blue pixel at (80, 141).
; PLAN: r0=393(x), r1=119(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=122(y1), r7=463(x2), r8=91(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=141(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 119
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 122
LDI r7, 463
LDI r8, 91
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 141
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
