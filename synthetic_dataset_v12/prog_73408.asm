; DESCRIPTION: Composite: Sets a single red pixel at (182, 33) then Draws a magenta line from (437, 184) to (10, 249) then Renders a purple disk with center (214, 190) and radius 21.
; PLAN: r0=182(x), r1=33(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=184(y1), r7=10(x2), r8=249(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=190(y), r12=21(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 33
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 437
LDI r6, 184
LDI r7, 10
LDI r8, 249
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 190
LDI r12, 21
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
