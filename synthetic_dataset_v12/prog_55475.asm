; DESCRIPTION: Composite: Draws a red rectangle at (431, 47) with width 80 and height 58 then Draws a magenta line from (21, 17) to (348, 250).
; PLAN: r0=431(x), r1=47(y), r2=80(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=17(y1), r7=348(x2), r8=250(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 47
LDI r2, 80
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 17
LDI r7, 348
LDI r8, 250
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
