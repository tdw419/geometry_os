; DESCRIPTION: Composite: Places a cyan line segment connecting (456, 146) to (447, 10) then Draws a purple rectangle at (169, 122) with width 94 and height 50 then Sets a single blue pixel at (94, 169).
; PLAN: r0=456(x1), r1=146(y1), r2=447(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=122(y), r7=94(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=169(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 146
LDI r2, 447
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 122
LDI r7, 94
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 169
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
