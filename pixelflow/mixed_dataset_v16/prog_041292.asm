; DESCRIPTION: Composite: Creates a green rectangular region at (358, 122) spanning 103 by 55 pixels then Renders a black line between points (85, 199) and (470, 79) then Places a yellow dot at position (497, 100).
; PLAN: r0=358(x), r1=122(y), r2=103(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=199(y1), r7=470(x2), r8=79(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=497(x), r11=100(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 122
LDI r2, 103
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 199
LDI r7, 470
LDI r8, 79
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 100
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
