; DESCRIPTION: Composite: Places a purple dot at position (263, 92) then Creates a green rectangular region at (444, 51) spanning 35 by 83 pixels then Places a cyan line segment connecting (221, 117) to (70, 105).
; PLAN: r0=263(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=51(y), r7=35(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=117(y1), r12=70(x2), r13=105(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 51
LDI r7, 35
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 117
LDI r12, 70
LDI r13, 105
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
