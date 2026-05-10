; DESCRIPTION: Composite: Draws a magenta line from (200, 71) to (381, 141) then Sets a single yellow pixel at (246, 93) then Draws a white rectangle at (410, 169) with width 94 and height 18.
; PLAN: r0=200(x1), r1=71(y1), r2=381(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=93(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=169(y), r12=94(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 71
LDI r2, 381
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 93
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 410
LDI r11, 169
LDI r12, 94
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
