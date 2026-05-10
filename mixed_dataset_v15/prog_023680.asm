; DESCRIPTION: Composite: Creates a white rectangular region at (95, 117) spanning 89 by 80 pixels then Draws a blue line from (413, 23) to (241, 142).
; PLAN: r0=95(x), r1=117(y), r2=89(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=23(y1), r7=241(x2), r8=142(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 117
LDI r2, 89
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 23
LDI r7, 241
LDI r8, 142
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
