; DESCRIPTION: Composite: Renders a purple line between points (365, 145) and (411, 203) then Draws a white circle centered at (171, 132) with radius 49 then Sets a single purple pixel at (77, 189).
; PLAN: r0=365(x1), r1=145(y1), r2=411(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=132(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=189(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 145
LDI r2, 411
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 132
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 189
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
