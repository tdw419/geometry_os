; DESCRIPTION: Composite: Sets a single red pixel at (199, 240) then Places a cyan circle of radius 59 at center (260, 118) then Draws a red line from (330, 92) to (187, 67).
; PLAN: r0=199(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=118(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x1), r11=92(y1), r12=187(x2), r13=67(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 118
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 92
LDI r12, 187
LDI r13, 67
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
