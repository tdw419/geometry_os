; DESCRIPTION: Composite: Renders a purple box of size 94x90 starting at (100, 118) then Places a yellow line segment connecting (136, 106) to (418, 153) then Places a black dot at position (80, 90).
; PLAN: r0=100(x), r1=118(y), r2=94(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=106(y1), r7=418(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=90(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 118
LDI r2, 94
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 106
LDI r7, 418
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 90
LDI r12, 0x000000
PSET r10, r11, r12
HALT
