; DESCRIPTION: Composite: Creates a yellow rectangular region at (60, 59) spanning 120 by 97 pixels then Creates a black circular shape at (458, 213) with radius 41 then Places a magenta line segment connecting (242, 179) to (149, 131).
; PLAN: r0=60(x), r1=59(y), r2=120(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=213(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=179(y1), r12=149(x2), r13=131(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 59
LDI r2, 120
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 213
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 179
LDI r12, 149
LDI r13, 131
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
