; DESCRIPTION: Composite: Creates a blue rectangular region at (220, 87) spanning 52 by 92 pixels then Places a red line segment connecting (423, 157) to (390, 39) then Places a cyan dot at position (38, 35).
; PLAN: r0=220(x), r1=87(y), r2=52(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=157(y1), r7=390(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=38(x), r11=35(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 87
LDI r2, 52
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 157
LDI r7, 390
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 35
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
