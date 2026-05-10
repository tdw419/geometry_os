; DESCRIPTION: Composite: Places a black dot at position (39, 247) then Draws a purple line from (229, 5) to (391, 154) then Draws a black rectangle at (13, 112) with width 92 and height 69.
; PLAN: r0=39(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=5(y1), r7=391(x2), r8=154(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=112(y), r12=92(width), r13=69(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 229
LDI r6, 5
LDI r7, 391
LDI r8, 154
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 112
LDI r12, 92
LDI r13, 69
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
