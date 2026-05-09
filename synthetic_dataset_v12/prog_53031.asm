; DESCRIPTION: Composite: Renders a green line between points (206, 191) and (380, 229) then Creates a red rectangular region at (164, 158) spanning 92 by 18 pixels then Renders a black disk with center (344, 99) and radius 64.
; PLAN: r0=206(x1), r1=191(y1), r2=380(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=158(y), r7=92(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=99(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 191
LDI r2, 380
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 158
LDI r7, 92
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 99
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
