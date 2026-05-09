; DESCRIPTION: Composite: Creates a green rectangular region at (27, 80) spanning 51 by 22 pixels then Sets a single black pixel at (93, 116) then Places a cyan line segment connecting (13, 27) to (448, 154).
; PLAN: r0=27(x), r1=80(y), r2=51(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=27(y1), r12=448(x2), r13=154(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 80
LDI r2, 51
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 13
LDI r11, 27
LDI r12, 448
LDI r13, 154
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
