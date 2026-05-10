; DESCRIPTION: Composite: Sets a single magenta pixel at (163, 145) then Creates a yellow rectangular region at (305, 46) spanning 120 by 90 pixels then Places a red line segment connecting (492, 99) to (345, 173).
; PLAN: r0=163(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=46(y), r7=120(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x1), r11=99(y1), r12=345(x2), r13=173(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 46
LDI r7, 120
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 99
LDI r12, 345
LDI r13, 173
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
