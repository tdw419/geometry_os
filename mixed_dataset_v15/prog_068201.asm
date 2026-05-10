; DESCRIPTION: Composite: Creates a blue rectangular region at (306, 3) spanning 65 by 85 pixels then Places a purple line segment connecting (473, 169) to (290, 133) then Sets a single cyan pixel at (360, 84).
; PLAN: r0=306(x), r1=3(y), r2=65(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x1), r6=169(y1), r7=290(x2), r8=133(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=84(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 3
LDI r2, 65
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 169
LDI r7, 290
LDI r8, 133
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 84
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
