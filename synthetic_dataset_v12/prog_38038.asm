; DESCRIPTION: Composite: Draws a red line from (216, 218) to (97, 0) then Places a red dot at position (145, 204) then Draws a red rectangle at (391, 120) with width 67 and height 96.
; PLAN: r0=216(x1), r1=218(y1), r2=97(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=204(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=120(y), r12=67(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 218
LDI r2, 97
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 204
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 391
LDI r11, 120
LDI r12, 67
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
