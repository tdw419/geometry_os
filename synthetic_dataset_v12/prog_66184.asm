; DESCRIPTION: Composite: Renders a purple line between points (197, 202) and (290, 108) then Creates a yellow rectangular region at (233, 181) spanning 90 by 68 pixels then Places a orange dot at position (102, 52).
; PLAN: r0=197(x1), r1=202(y1), r2=290(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=181(y), r7=90(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=52(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 202
LDI r2, 290
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 181
LDI r7, 90
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 52
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
