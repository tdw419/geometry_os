; DESCRIPTION: Composite: Sets a single orange pixel at (352, 49) then Draws a cyan line from (504, 135) to (484, 169) then Creates a magenta circular shape at (172, 177) with radius 44.
; PLAN: r0=352(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=135(y1), r7=484(x2), r8=169(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=177(y), r12=44(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 504
LDI r6, 135
LDI r7, 484
LDI r8, 169
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 177
LDI r12, 44
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
