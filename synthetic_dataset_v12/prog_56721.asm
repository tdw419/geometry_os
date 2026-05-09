; DESCRIPTION: Composite: Renders a orange line between points (423, 192) and (269, 73) then Renders a magenta box of size 96x67 starting at (202, 178) then Sets a single red pixel at (448, 201).
; PLAN: r0=423(x1), r1=192(y1), r2=269(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=178(y), r7=96(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=201(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 192
LDI r2, 269
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 178
LDI r7, 96
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 201
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
