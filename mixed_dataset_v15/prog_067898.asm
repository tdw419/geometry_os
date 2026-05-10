; DESCRIPTION: Composite: Sets a single white pixel at (59, 172) then Renders a red line between points (300, 138) and (206, 214) then Creates a red circular shape at (448, 190) with radius 57.
; PLAN: r0=59(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=300(x1), r6=138(y1), r7=206(x2), r8=214(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=190(y), r12=57(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 138
LDI r7, 206
LDI r8, 214
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 190
LDI r12, 57
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
