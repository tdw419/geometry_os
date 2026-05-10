; DESCRIPTION: Composite: Places a black dot at position (424, 13) then Draws a white line from (378, 111) to (182, 169) then Renders a white box of size 72x112 starting at (208, 11).
; PLAN: r0=424(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=111(y1), r7=182(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=11(y), r12=72(width), r13=112(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 378
LDI r6, 111
LDI r7, 182
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 11
LDI r12, 72
LDI r13, 112
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
