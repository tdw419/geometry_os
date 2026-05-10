; DESCRIPTION: Composite: Renders a purple line between points (57, 205) and (470, 80) then Places a yellow 70x95 rectangle at position (186, 145) then Places a orange dot at position (98, 163).
; PLAN: r0=57(x1), r1=205(y1), r2=470(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=145(y), r7=70(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=163(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 57
LDI r1, 205
LDI r2, 470
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 145
LDI r7, 70
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 163
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
