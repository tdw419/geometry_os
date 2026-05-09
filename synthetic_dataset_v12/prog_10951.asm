; DESCRIPTION: Composite: Places a red dot at position (378, 96) then Draws a orange line from (368, 110) to (369, 20) then Renders a yellow box of size 38x20 starting at (212, 224).
; PLAN: r0=378(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=110(y1), r7=369(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=224(y), r12=38(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 368
LDI r6, 110
LDI r7, 369
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 224
LDI r12, 38
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
