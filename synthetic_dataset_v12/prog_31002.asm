; DESCRIPTION: Composite: Creates a purple rectangular region at (280, 69) spanning 80 by 20 pixels then Renders a cyan line between points (25, 28) and (496, 106) then Sets a single yellow pixel at (357, 236).
; PLAN: r0=280(x), r1=69(y), r2=80(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x1), r6=28(y1), r7=496(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=236(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 69
LDI r2, 80
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 28
LDI r7, 496
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 236
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
