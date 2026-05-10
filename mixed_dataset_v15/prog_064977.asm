; DESCRIPTION: Composite: Places a yellow line segment connecting (39, 217) to (130, 146) then Creates a cyan rectangular region at (480, 141) spanning 25 by 22 pixels then Places a red circle of radius 49 at center (118, 149).
; PLAN: r0=39(x1), r1=217(y1), r2=130(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=141(y), r7=25(width), r8=22(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x), r11=149(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 217
LDI r2, 130
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 141
LDI r7, 25
LDI r8, 22
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 149
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
