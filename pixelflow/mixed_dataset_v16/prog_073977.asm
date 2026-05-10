; DESCRIPTION: Composite: Creates a blue rectangular region at (230, 29) spanning 19 by 35 pixels then Renders a green line between points (216, 31) and (35, 207).
; PLAN: r0=230(x), r1=29(y), r2=19(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=31(y1), r7=35(x2), r8=207(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 29
LDI r2, 19
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 31
LDI r7, 35
LDI r8, 207
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
