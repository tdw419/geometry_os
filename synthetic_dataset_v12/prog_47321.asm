; DESCRIPTION: Composite: Places a red line segment connecting (23, 27) to (487, 56) then Sets a single magenta pixel at (344, 70) then Creates a green rectangular region at (297, 11) spanning 102 by 106 pixels.
; PLAN: r0=23(x1), r1=27(y1), r2=487(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=70(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=11(y), r12=102(width), r13=106(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 27
LDI r2, 487
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 70
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 11
LDI r12, 102
LDI r13, 106
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
