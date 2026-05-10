; DESCRIPTION: Composite: Places a blue dot at position (147, 68) then Creates a black circular shape at (410, 116) with radius 61 then Renders a red line between points (324, 24) and (157, 157).
; PLAN: r0=147(x), r1=68(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=116(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=24(y1), r12=157(x2), r13=157(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 68
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 116
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 24
LDI r12, 157
LDI r13, 157
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
