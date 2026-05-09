; DESCRIPTION: Composite: Creates a blue rectangular region at (226, 58) spanning 12 by 48 pixels then Draws a purple line from (13, 29) to (362, 81) then Places a orange dot at position (166, 139).
; PLAN: r0=226(x), r1=58(y), r2=12(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x1), r6=29(y1), r7=362(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=139(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 58
LDI r2, 12
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 29
LDI r7, 362
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 139
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
