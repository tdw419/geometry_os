; DESCRIPTION: Composite: Places a cyan dot at position (493, 6) then Creates a green rectangular region at (399, 215) spanning 43 by 21 pixels then Places a black line segment connecting (461, 109) to (145, 75).
; PLAN: r0=493(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=215(y), r7=43(width), r8=21(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=461(x1), r11=109(y1), r12=145(x2), r13=75(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 215
LDI r7, 43
LDI r8, 21
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 109
LDI r12, 145
LDI r13, 75
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
