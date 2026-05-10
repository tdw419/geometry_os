; DESCRIPTION: Composite: Draws a cyan line from (303, 60) to (119, 169) then Sets a single green pixel at (304, 44) then Draws a red circle centered at (327, 92) with radius 66.
; PLAN: r0=303(x1), r1=60(y1), r2=119(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=44(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=92(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 60
LDI r2, 119
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 44
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 327
LDI r11, 92
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
