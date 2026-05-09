; DESCRIPTION: Composite: Places a red line segment connecting (506, 58) to (466, 43) then Renders a black box of size 87x52 starting at (22, 169).
; PLAN: r0=506(x1), r1=58(y1), r2=466(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=169(y), r7=87(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 506
LDI r1, 58
LDI r2, 466
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 169
LDI r7, 87
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
