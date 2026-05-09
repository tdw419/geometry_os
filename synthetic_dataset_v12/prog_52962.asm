; DESCRIPTION: Composite: Sets a single yellow pixel at (303, 199) then Renders a purple line between points (445, 183) and (69, 116) then Places a red circle of radius 19 at center (389, 198).
; PLAN: r0=303(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=183(y1), r7=69(x2), r8=116(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=198(y), r12=19(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 445
LDI r6, 183
LDI r7, 69
LDI r8, 116
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 198
LDI r12, 19
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
