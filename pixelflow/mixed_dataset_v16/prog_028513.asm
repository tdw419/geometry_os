; DESCRIPTION: Composite: Sets a single white pixel at (369, 104) then Renders a purple box of size 28x37 starting at (229, 148) then Draws a purple line from (11, 96) to (480, 129).
; PLAN: r0=369(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=148(y), r7=28(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x1), r11=96(y1), r12=480(x2), r13=129(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 148
LDI r7, 28
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 96
LDI r12, 480
LDI r13, 129
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
