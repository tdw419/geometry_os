; DESCRIPTION: Composite: Renders a white box of size 66x82 starting at (108, 162) then Places a yellow line segment connecting (311, 233) to (250, 19) then Sets a single yellow pixel at (358, 113).
; PLAN: r0=108(x), r1=162(y), r2=66(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x1), r6=233(y1), r7=250(x2), r8=19(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=113(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 162
LDI r2, 66
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 233
LDI r7, 250
LDI r8, 19
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 113
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
