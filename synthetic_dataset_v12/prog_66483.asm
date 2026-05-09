; DESCRIPTION: Composite: Places a white dot at position (274, 174) then Creates a yellow rectangular region at (23, 77) spanning 52 by 112 pixels then Draws a green line from (117, 7) to (350, 54).
; PLAN: r0=274(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=77(y), r7=52(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x1), r11=7(y1), r12=350(x2), r13=54(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 77
LDI r7, 52
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 7
LDI r12, 350
LDI r13, 54
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
