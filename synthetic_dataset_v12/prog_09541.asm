; DESCRIPTION: Composite: Sets a single yellow pixel at (289, 202) then Creates a yellow rectangular region at (429, 19) spanning 59 by 15 pixels then Renders a purple line between points (506, 110) and (228, 215).
; PLAN: r0=289(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=19(y), r7=59(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x1), r11=110(y1), r12=228(x2), r13=215(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 429
LDI r6, 19
LDI r7, 59
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 110
LDI r12, 228
LDI r13, 215
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
