; DESCRIPTION: Composite: Places a magenta dot at position (467, 211) then Creates a purple rectangular region at (387, 4) spanning 21 by 79 pixels then Draws a purple line from (463, 90) to (289, 131).
; PLAN: r0=467(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=4(y), r7=21(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x1), r11=90(y1), r12=289(x2), r13=131(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 4
LDI r7, 21
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 90
LDI r12, 289
LDI r13, 131
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
