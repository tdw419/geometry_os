; DESCRIPTION: Composite: Places a yellow circle of radius 35 at center (456, 152) then Places a red 105x20 rectangle at position (307, 208) then Draws a purple line from (185, 126) to (477, 123).
; PLAN: r0=456(x), r1=152(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=208(y), r7=105(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x1), r11=126(y1), r12=477(x2), r13=123(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 152
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 208
LDI r7, 105
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 126
LDI r12, 477
LDI r13, 123
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
