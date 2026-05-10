; DESCRIPTION: Composite: Draws a green line from (474, 249) to (42, 134) then Creates a orange rectangular region at (116, 124) spanning 78 by 62 pixels then Places a yellow dot at position (158, 15).
; PLAN: r0=474(x1), r1=249(y1), r2=42(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=124(y), r7=78(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=15(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 474
LDI r1, 249
LDI r2, 42
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 124
LDI r7, 78
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 15
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
