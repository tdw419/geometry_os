; DESCRIPTION: Composite: Creates a green rectangular region at (392, 136) spanning 112 by 46 pixels then Renders a cyan line between points (445, 165) and (88, 116).
; PLAN: r0=392(x), r1=136(y), r2=112(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=165(y1), r7=88(x2), r8=116(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 136
LDI r2, 112
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 165
LDI r7, 88
LDI r8, 116
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
