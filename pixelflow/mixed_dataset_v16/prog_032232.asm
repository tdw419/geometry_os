; DESCRIPTION: Composite: Creates a yellow rectangular region at (450, 37) spanning 57 by 42 pixels then Draws a purple line from (312, 137) to (357, 146) then Sets a single yellow pixel at (487, 187).
; PLAN: r0=450(x), r1=37(y), r2=57(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=137(y1), r7=357(x2), r8=146(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=187(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 37
LDI r2, 57
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 137
LDI r7, 357
LDI r8, 146
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 187
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
