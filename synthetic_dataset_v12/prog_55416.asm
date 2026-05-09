; DESCRIPTION: Composite: Creates a cyan rectangular region at (286, 77) spanning 109 by 110 pixels then Sets a single magenta pixel at (347, 79) then Renders a magenta line between points (341, 118) and (125, 91).
; PLAN: r0=286(x), r1=77(y), r2=109(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=79(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=341(x1), r11=118(y1), r12=125(x2), r13=91(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 77
LDI r2, 109
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 79
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 341
LDI r11, 118
LDI r12, 125
LDI r13, 91
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
