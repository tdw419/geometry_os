; DESCRIPTION: Composite: Renders a yellow box of size 82x89 starting at (153, 121) then Renders a white line between points (497, 13) and (459, 251) then Sets a single purple pixel at (353, 140).
; PLAN: r0=153(x), r1=121(y), r2=82(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x1), r6=13(y1), r7=459(x2), r8=251(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=140(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 121
LDI r2, 82
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 13
LDI r7, 459
LDI r8, 251
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 140
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
