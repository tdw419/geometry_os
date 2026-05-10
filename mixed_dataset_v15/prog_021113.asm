; DESCRIPTION: Composite: Creates a orange rectangular region at (146, 41) spanning 120 by 110 pixels then Places a purple line segment connecting (376, 98) to (358, 92) then Places a blue dot at position (53, 77).
; PLAN: r0=146(x), r1=41(y), r2=120(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x1), r6=98(y1), r7=358(x2), r8=92(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=77(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 41
LDI r2, 120
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 98
LDI r7, 358
LDI r8, 92
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 77
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
