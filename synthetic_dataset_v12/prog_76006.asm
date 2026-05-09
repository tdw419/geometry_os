; DESCRIPTION: Composite: Places a white line segment connecting (511, 183) to (351, 47) then Places a magenta 21x116 rectangle at position (74, 52) then Sets a single magenta pixel at (455, 241).
; PLAN: r0=511(x1), r1=183(y1), r2=351(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=52(y), r7=21(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=241(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 511
LDI r1, 183
LDI r2, 351
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 52
LDI r7, 21
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 241
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
