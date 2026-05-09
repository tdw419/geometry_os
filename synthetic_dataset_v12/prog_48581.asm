; DESCRIPTION: Composite: Creates a white rectangular region at (318, 56) spanning 103 by 112 pixels then Places a black dot at position (323, 111) then Renders a orange line between points (470, 231) and (467, 154).
; PLAN: r0=318(x), r1=56(y), r2=103(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=111(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=470(x1), r11=231(y1), r12=467(x2), r13=154(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 56
LDI r2, 103
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 111
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 470
LDI r11, 231
LDI r12, 467
LDI r13, 154
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
