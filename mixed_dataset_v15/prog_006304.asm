; DESCRIPTION: Composite: Places a magenta dot at position (199, 127) then Draws a magenta line from (486, 105) to (130, 241) then Creates a red circular shape at (309, 131) with radius 67.
; PLAN: r0=199(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=486(x1), r6=105(y1), r7=130(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=131(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 486
LDI r6, 105
LDI r7, 130
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 131
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
