; DESCRIPTION: Composite: Creates a magenta rectangular region at (76, 62) spanning 82 by 20 pixels then Sets a single purple pixel at (440, 186) then Renders a red line between points (463, 79) and (477, 242).
; PLAN: r0=76(x), r1=62(y), r2=82(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=186(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=463(x1), r11=79(y1), r12=477(x2), r13=242(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 62
LDI r2, 82
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 186
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 463
LDI r11, 79
LDI r12, 477
LDI r13, 242
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
