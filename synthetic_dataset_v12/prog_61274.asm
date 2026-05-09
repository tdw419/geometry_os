; DESCRIPTION: Composite: Draws a green line from (257, 186) to (206, 53) then Creates a white rectangular region at (185, 34) spanning 37 by 44 pixels then Sets a single yellow pixel at (189, 146).
; PLAN: r0=257(x1), r1=186(y1), r2=206(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=34(y), r7=37(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=146(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 186
LDI r2, 206
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 34
LDI r7, 37
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 146
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
