; DESCRIPTION: Composite: Places a cyan line segment connecting (369, 186) to (367, 74) then Creates a yellow rectangular region at (126, 14) spanning 89 by 119 pixels.
; PLAN: r0=369(x1), r1=186(y1), r2=367(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=14(y), r7=89(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 186
LDI r2, 367
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 14
LDI r7, 89
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
