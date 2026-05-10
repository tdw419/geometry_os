; DESCRIPTION: Composite: Creates a white rectangular region at (236, 136) spanning 117 by 46 pixels then Places a purple line segment connecting (122, 161) to (204, 4) then Sets a single purple pixel at (106, 63).
; PLAN: r0=236(x), r1=136(y), r2=117(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=161(y1), r7=204(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=63(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 136
LDI r2, 117
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 161
LDI r7, 204
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 63
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
