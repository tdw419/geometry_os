; DESCRIPTION: Composite: Places a red dot at position (347, 171) then Places a magenta line segment connecting (504, 19) to (508, 34) then Creates a blue circular shape at (206, 186) with radius 49.
; PLAN: r0=347(x), r1=171(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=19(y1), r7=508(x2), r8=34(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=186(y), r12=49(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 171
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 504
LDI r6, 19
LDI r7, 508
LDI r8, 34
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 186
LDI r12, 49
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
