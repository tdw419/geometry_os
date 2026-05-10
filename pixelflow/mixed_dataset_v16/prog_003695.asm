; DESCRIPTION: Composite: Creates a magenta rectangular region at (294, 110) spanning 41 by 51 pixels then Renders a white line between points (349, 50) and (38, 99) then Sets a single black pixel at (447, 78).
; PLAN: r0=294(x), r1=110(y), r2=41(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=50(y1), r7=38(x2), r8=99(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 110
LDI r2, 41
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 50
LDI r7, 38
LDI r8, 99
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
