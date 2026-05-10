; DESCRIPTION: Composite: Places a orange 36x30 rectangle at position (29, 201) then Renders a purple line between points (232, 95) and (193, 70).
; PLAN: r0=29(x), r1=201(y), r2=36(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=95(y1), r7=193(x2), r8=70(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 201
LDI r2, 36
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 95
LDI r7, 193
LDI r8, 70
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
