; DESCRIPTION: Composite: Creates a cyan rectangular region at (2, 187) spanning 55 by 69 pixels then Places a yellow line segment connecting (419, 107) to (328, 162) then Places a red circle of radius 52 at center (306, 137).
; PLAN: r0=2(x), r1=187(y), r2=55(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=107(y1), r7=328(x2), r8=162(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=137(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 187
LDI r2, 55
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 107
LDI r7, 328
LDI r8, 162
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 137
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
