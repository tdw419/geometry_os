; DESCRIPTION: Composite: Places a white dot at position (210, 38) then Creates a green rectangular region at (330, 94) spanning 55 by 110 pixels then Renders a green line between points (105, 8) and (72, 183).
; PLAN: r0=210(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=94(y), r7=55(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x1), r11=8(y1), r12=72(x2), r13=183(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 94
LDI r7, 55
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 8
LDI r12, 72
LDI r13, 183
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
