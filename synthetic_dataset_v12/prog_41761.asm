; DESCRIPTION: Composite: Places a orange circle of radius 58 at center (377, 108) then Renders a magenta line between points (344, 71) and (315, 186).
; PLAN: r0=377(x), r1=108(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x1), r6=71(y1), r7=315(x2), r8=186(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 108
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 71
LDI r7, 315
LDI r8, 186
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
