; DESCRIPTION: Composite: Sets a single red pixel at (221, 216) then Creates a magenta rectangular region at (293, 91) spanning 91 by 19 pixels then Places a purple line segment connecting (329, 47) to (173, 225).
; PLAN: r0=221(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=91(y), r7=91(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x1), r11=47(y1), r12=173(x2), r13=225(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 293
LDI r6, 91
LDI r7, 91
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 47
LDI r12, 173
LDI r13, 225
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
