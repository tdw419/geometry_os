; DESCRIPTION: Composite: Creates a magenta rectangular region at (303, 60) spanning 76 by 120 pixels then Draws a cyan line from (44, 24) to (88, 38) then Sets a single blue pixel at (139, 47).
; PLAN: r0=303(x), r1=60(y), r2=76(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x1), r6=24(y1), r7=88(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=47(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 60
LDI r2, 76
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 24
LDI r7, 88
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 47
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
