; DESCRIPTION: Composite: Places a black dot at position (484, 146) then Places a magenta line segment connecting (123, 74) to (172, 236) then Creates a cyan circular shape at (309, 68) with radius 33.
; PLAN: r0=484(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=74(y1), r7=172(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=68(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 123
LDI r6, 74
LDI r7, 172
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 68
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
