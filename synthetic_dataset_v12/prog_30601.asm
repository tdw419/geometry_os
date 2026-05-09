; DESCRIPTION: Composite: Places a red line segment connecting (225, 20) to (417, 53) then Renders a blue box of size 110x37 starting at (42, 145).
; PLAN: r0=225(x1), r1=20(y1), r2=417(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=145(y), r7=110(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 20
LDI r2, 417
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 145
LDI r7, 110
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
