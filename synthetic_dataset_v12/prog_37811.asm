; DESCRIPTION: Composite: Creates a orange rectangular region at (183, 72) spanning 104 by 17 pixels then Renders a blue line between points (183, 62) and (369, 254) then Places a magenta dot at position (448, 166).
; PLAN: r0=183(x), r1=72(y), r2=104(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x1), r6=62(y1), r7=369(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=166(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 72
LDI r2, 104
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 62
LDI r7, 369
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 166
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
