; DESCRIPTION: Composite: Draws a yellow line from (486, 104) to (361, 7) then Creates a red rectangular region at (104, 172) spanning 109 by 51 pixels.
; PLAN: r0=486(x1), r1=104(y1), r2=361(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=172(y), r7=109(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 104
LDI r2, 361
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 172
LDI r7, 109
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
