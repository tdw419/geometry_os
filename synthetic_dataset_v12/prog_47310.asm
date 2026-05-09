; DESCRIPTION: Composite: Places a magenta dot at position (320, 82) then Renders a purple line between points (366, 20) and (77, 20) then Draws a red rectangle at (10, 109) with width 98 and height 66.
; PLAN: r0=320(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=366(x1), r6=20(y1), r7=77(x2), r8=20(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=109(y), r12=98(width), r13=66(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 82
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 20
LDI r7, 77
LDI r8, 20
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 109
LDI r12, 98
LDI r13, 66
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
