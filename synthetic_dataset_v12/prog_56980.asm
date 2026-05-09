; DESCRIPTION: Composite: Places a red dot at position (274, 128) then Draws a cyan line from (429, 74) to (261, 147) then Draws a black rectangle at (373, 169) with width 47 and height 11.
; PLAN: r0=274(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=74(y1), r7=261(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=169(y), r12=47(width), r13=11(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 74
LDI r7, 261
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 169
LDI r12, 47
LDI r13, 11
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
