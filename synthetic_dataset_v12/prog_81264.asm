; DESCRIPTION: Composite: Places a magenta line segment connecting (424, 194) to (477, 143) then Renders a white box of size 12x98 starting at (100, 51) then Sets a single red pixel at (297, 74).
; PLAN: r0=424(x1), r1=194(y1), r2=477(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=51(y), r7=12(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=74(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 194
LDI r2, 477
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 51
LDI r7, 12
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 74
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
