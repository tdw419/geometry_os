; DESCRIPTION: Composite: Creates a blue rectangular region at (394, 145) spanning 15 by 61 pixels then Places a green circle of radius 74 at center (104, 120) then Places a green line segment connecting (59, 156) to (79, 52).
; PLAN: r0=394(x), r1=145(y), r2=15(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=120(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x1), r11=156(y1), r12=79(x2), r13=52(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 145
LDI r2, 15
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 120
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 156
LDI r12, 79
LDI r13, 52
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
