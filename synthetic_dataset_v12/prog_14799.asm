; DESCRIPTION: Composite: Places a red line segment connecting (12, 16) to (243, 136) then Creates a yellow rectangular region at (100, 20) spanning 23 by 115 pixels then Sets a single white pixel at (341, 92).
; PLAN: r0=12(x1), r1=16(y1), r2=243(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=20(y), r7=23(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x), r11=92(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 16
LDI r2, 243
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 20
LDI r7, 23
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 92
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
