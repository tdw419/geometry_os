; DESCRIPTION: Composite: Sets a single cyan pixel at (487, 95) then Draws a blue line from (443, 192) to (495, 120) then Draws a purple circle centered at (448, 78) with radius 19.
; PLAN: r0=487(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=443(x1), r6=192(y1), r7=495(x2), r8=120(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=78(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 192
LDI r7, 495
LDI r8, 120
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 78
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
