; DESCRIPTION: Composite: Creates a cyan rectangular region at (251, 87) spanning 21 by 114 pixels then Renders a purple line between points (445, 151) and (123, 216) then Sets a single orange pixel at (302, 241).
; PLAN: r0=251(x), r1=87(y), r2=21(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=151(y1), r7=123(x2), r8=216(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=241(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 87
LDI r2, 21
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 151
LDI r7, 123
LDI r8, 216
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 241
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
