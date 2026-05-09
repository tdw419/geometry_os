; DESCRIPTION: Composite: Sets a single cyan pixel at (89, 34) then Draws a yellow line from (21, 53) to (306, 243) then Creates a magenta rectangular region at (199, 17) spanning 81 by 92 pixels.
; PLAN: r0=89(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=53(y1), r7=306(x2), r8=243(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=17(y), r12=81(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 53
LDI r7, 306
LDI r8, 243
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 17
LDI r12, 81
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
