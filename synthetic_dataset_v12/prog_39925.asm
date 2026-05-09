; DESCRIPTION: Composite: Renders a white line between points (431, 161) and (469, 230) then Creates a red rectangular region at (90, 153) spanning 51 by 26 pixels.
; PLAN: r0=431(x1), r1=161(y1), r2=469(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=153(y), r7=51(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 161
LDI r2, 469
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 153
LDI r7, 51
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
