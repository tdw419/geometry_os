; DESCRIPTION: Composite: Creates a orange rectangular region at (312, 136) spanning 48 by 11 pixels then Renders a magenta line between points (216, 87) and (461, 125) then Sets a single red pixel at (372, 16).
; PLAN: r0=312(x), r1=136(y), r2=48(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=87(y1), r7=461(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=16(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 136
LDI r2, 48
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 87
LDI r7, 461
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 16
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
