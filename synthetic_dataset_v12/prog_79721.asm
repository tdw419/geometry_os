; DESCRIPTION: Composite: Creates a magenta rectangular region at (143, 53) spanning 65 by 91 pixels then Renders a black line between points (131, 155) and (34, 51).
; PLAN: r0=143(x), r1=53(y), r2=65(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=155(y1), r7=34(x2), r8=51(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 53
LDI r2, 65
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 155
LDI r7, 34
LDI r8, 51
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
