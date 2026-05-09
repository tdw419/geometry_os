; DESCRIPTION: Composite: Places a purple dot at position (20, 184) then Places a white line segment connecting (90, 160) to (77, 117) then Creates a red rectangular region at (330, 25) spanning 103 by 91 pixels.
; PLAN: r0=20(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=160(y1), r7=77(x2), r8=117(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=25(y), r12=103(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 160
LDI r7, 77
LDI r8, 117
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 25
LDI r12, 103
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
