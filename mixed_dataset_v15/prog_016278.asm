; DESCRIPTION: Composite: Sets a single orange pixel at (382, 72) then Renders a purple line between points (171, 210) and (410, 55) then Creates a magenta circular shape at (232, 167) with radius 36.
; PLAN: r0=382(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=171(x1), r6=210(y1), r7=410(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=167(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 171
LDI r6, 210
LDI r7, 410
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 167
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
