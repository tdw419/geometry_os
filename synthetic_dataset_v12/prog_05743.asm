; DESCRIPTION: Composite: Creates a purple rectangular region at (36, 94) spanning 10 by 108 pixels then Places a cyan line segment connecting (219, 110) to (443, 153) then Places a blue dot at position (391, 28).
; PLAN: r0=36(x), r1=94(y), r2=10(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=110(y1), r7=443(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=28(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 94
LDI r2, 10
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 110
LDI r7, 443
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 28
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
