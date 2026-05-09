; DESCRIPTION: Composite: Places a orange dot at position (339, 133) then Renders a purple line between points (428, 241) and (442, 70).
; PLAN: r0=339(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=241(y1), r7=442(x2), r8=70(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 428
LDI r6, 241
LDI r7, 442
LDI r8, 70
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
