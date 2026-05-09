; DESCRIPTION: Composite: Draws a orange line from (300, 217) to (269, 147) then Places a red 92x118 rectangle at position (405, 67).
; PLAN: r0=300(x1), r1=217(y1), r2=269(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=67(y), r7=92(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 217
LDI r2, 269
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 67
LDI r7, 92
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
