; DESCRIPTION: Composite: Renders a red line between points (468, 183) and (328, 50) then Renders a red box of size 49x84 starting at (122, 131).
; PLAN: r0=468(x1), r1=183(y1), r2=328(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=131(y), r7=49(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 183
LDI r2, 328
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 131
LDI r7, 49
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
