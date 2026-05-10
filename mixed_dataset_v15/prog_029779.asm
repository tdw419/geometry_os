; DESCRIPTION: Composite: Creates a orange rectangular region at (344, 50) spanning 73 by 66 pixels then Places a blue line segment connecting (68, 21) to (335, 131) then Sets a single green pixel at (213, 207).
; PLAN: r0=344(x), r1=50(y), r2=73(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=21(y1), r7=335(x2), r8=131(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=207(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 50
LDI r2, 73
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 21
LDI r7, 335
LDI r8, 131
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 207
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
