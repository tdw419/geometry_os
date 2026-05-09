; DESCRIPTION: Composite: Sets a single cyan pixel at (441, 66) then Draws a yellow rectangle at (31, 198) with width 116 and height 54 then Renders a cyan line between points (483, 235) and (67, 92).
; PLAN: r0=441(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=198(y), r7=116(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=483(x1), r11=235(y1), r12=67(x2), r13=92(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 198
LDI r7, 116
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 235
LDI r12, 67
LDI r13, 92
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
