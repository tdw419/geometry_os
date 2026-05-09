; DESCRIPTION: Composite: Places a magenta dot at position (254, 166) then Creates a magenta rectangular region at (138, 22) spanning 106 by 14 pixels then Renders a red line between points (54, 206) and (98, 106).
; PLAN: r0=254(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=22(y), r7=106(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=206(y1), r12=98(x2), r13=106(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 138
LDI r6, 22
LDI r7, 106
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 206
LDI r12, 98
LDI r13, 106
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
