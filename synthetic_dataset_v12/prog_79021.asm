; DESCRIPTION: Composite: Draws a purple line from (97, 143) to (45, 138) then Renders a magenta box of size 118x115 starting at (372, 54) then Sets a single orange pixel at (409, 196).
; PLAN: r0=97(x1), r1=143(y1), r2=45(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=54(y), r7=118(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=196(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 143
LDI r2, 45
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 54
LDI r7, 118
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 196
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
