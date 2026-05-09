; DESCRIPTION: Composite: Creates a orange rectangular region at (222, 97) spanning 27 by 54 pixels then Draws a red line from (282, 217) to (124, 247) then Places a yellow dot at position (178, 101).
; PLAN: r0=222(x), r1=97(y), r2=27(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=217(y1), r7=124(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=101(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 97
LDI r2, 27
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 217
LDI r7, 124
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 101
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
