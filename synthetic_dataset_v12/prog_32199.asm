; DESCRIPTION: Composite: Sets a single red pixel at (390, 174) then Renders a magenta line between points (167, 24) and (281, 4) then Draws a purple rectangle at (285, 139) with width 111 and height 65.
; PLAN: r0=390(x), r1=174(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=24(y1), r7=281(x2), r8=4(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=139(y), r12=111(width), r13=65(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 174
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 24
LDI r7, 281
LDI r8, 4
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 139
LDI r12, 111
LDI r13, 65
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
