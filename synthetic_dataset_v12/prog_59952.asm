; DESCRIPTION: Composite: Places a cyan line segment connecting (84, 145) to (100, 116) then Creates a cyan rectangular region at (432, 100) spanning 20 by 113 pixels.
; PLAN: r0=84(x1), r1=145(y1), r2=100(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=100(y), r7=20(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 145
LDI r2, 100
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 100
LDI r7, 20
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
