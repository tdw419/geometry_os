; DESCRIPTION: Composite: Creates a orange rectangular region at (438, 145) spanning 46 by 74 pixels then Sets a single yellow pixel at (121, 25) then Places a cyan line segment connecting (497, 140) to (415, 94).
; PLAN: r0=438(x), r1=145(y), r2=46(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=497(x1), r11=140(y1), r12=415(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 145
LDI r2, 46
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 497
LDI r11, 140
LDI r12, 415
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
