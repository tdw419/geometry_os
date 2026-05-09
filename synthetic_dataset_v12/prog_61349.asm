; DESCRIPTION: Composite: Creates a magenta rectangular region at (152, 38) spanning 28 by 110 pixels then Renders a white line between points (25, 187) and (63, 77).
; PLAN: r0=152(x), r1=38(y), r2=28(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x1), r6=187(y1), r7=63(x2), r8=77(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 38
LDI r2, 28
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 187
LDI r7, 63
LDI r8, 77
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
