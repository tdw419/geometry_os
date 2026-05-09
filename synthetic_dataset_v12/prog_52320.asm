; DESCRIPTION: Composite: Places a magenta dot at position (199, 104) then Draws a purple line from (106, 180) to (392, 103) then Creates a purple rectangular region at (53, 107) spanning 47 by 89 pixels.
; PLAN: r0=199(x), r1=104(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=180(y1), r7=392(x2), r8=103(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=107(y), r12=47(width), r13=89(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 104
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 180
LDI r7, 392
LDI r8, 103
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 107
LDI r12, 47
LDI r13, 89
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
