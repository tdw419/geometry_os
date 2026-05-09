; DESCRIPTION: Composite: Sets a single white pixel at (317, 190) then Creates a red circular shape at (352, 191) with radius 50 then Draws a red line from (169, 68) to (270, 198).
; PLAN: r0=317(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=191(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x1), r11=68(y1), r12=270(x2), r13=198(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 191
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 68
LDI r12, 270
LDI r13, 198
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
