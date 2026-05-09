; DESCRIPTION: Composite: Places a purple dot at position (129, 30) then Creates a yellow rectangular region at (122, 135) spanning 52 by 34 pixels then Places a magenta line segment connecting (75, 204) to (460, 12).
; PLAN: r0=129(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=135(y), r7=52(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x1), r11=204(y1), r12=460(x2), r13=12(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 135
LDI r7, 52
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 204
LDI r12, 460
LDI r13, 12
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
