; DESCRIPTION: Composite: Places a yellow dot at position (133, 111) then Creates a white rectangular region at (117, 112) spanning 74 by 30 pixels then Renders a red line between points (343, 89) and (26, 171).
; PLAN: r0=133(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=112(y), r7=74(width), r8=30(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=89(y1), r12=26(x2), r13=171(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 112
LDI r7, 74
LDI r8, 30
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 89
LDI r12, 26
LDI r13, 171
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
