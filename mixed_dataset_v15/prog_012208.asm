; DESCRIPTION: Composite: Places a black circle of radius 35 at center (61, 217) then Renders a green box of size 18x85 starting at (348, 162) then Renders a red line between points (295, 107) and (175, 242).
; PLAN: r0=61(x), r1=217(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=162(y), r7=18(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x1), r11=107(y1), r12=175(x2), r13=242(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 217
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 162
LDI r7, 18
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 107
LDI r12, 175
LDI r13, 242
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
