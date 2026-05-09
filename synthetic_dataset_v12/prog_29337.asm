; DESCRIPTION: Composite: Renders a magenta line between points (410, 54) and (21, 200) then Creates a green rectangular region at (233, 194) spanning 89 by 14 pixels then Sets a single magenta pixel at (331, 240).
; PLAN: r0=410(x1), r1=54(y1), r2=21(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=194(y), r7=89(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x), r11=240(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 54
LDI r2, 21
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 194
LDI r7, 89
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 240
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
