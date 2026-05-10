; DESCRIPTION: Composite: Creates a purple rectangular region at (26, 170) spanning 82 by 18 pixels then Renders a blue line between points (180, 236) and (186, 186).
; PLAN: r0=26(x), r1=170(y), r2=82(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x1), r6=236(y1), r7=186(x2), r8=186(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 170
LDI r2, 82
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 236
LDI r7, 186
LDI r8, 186
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
