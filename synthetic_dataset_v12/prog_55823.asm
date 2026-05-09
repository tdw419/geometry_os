; DESCRIPTION: Composite: Places a black dot at position (23, 179) then Renders a purple line between points (312, 96) and (21, 119) then Draws a blue rectangle at (70, 139) with width 12 and height 94.
; PLAN: r0=23(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=96(y1), r7=21(x2), r8=119(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=139(y), r12=12(width), r13=94(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 96
LDI r7, 21
LDI r8, 119
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 139
LDI r12, 12
LDI r13, 94
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
