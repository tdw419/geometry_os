; DESCRIPTION: Composite: Renders a red box of size 115x17 starting at (9, 151) then Draws a black line from (87, 162) to (101, 91) then Places a cyan circle of radius 60 at center (447, 190).
; PLAN: r0=9(x), r1=151(y), r2=115(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=162(y1), r7=101(x2), r8=91(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=190(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 151
LDI r2, 115
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 162
LDI r7, 101
LDI r8, 91
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 190
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
