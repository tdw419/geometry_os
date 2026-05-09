; DESCRIPTION: Composite: Renders a green box of size 49x58 starting at (222, 0) then Renders a black line between points (246, 121) and (453, 11).
; PLAN: r0=222(x), r1=0(y), r2=49(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=121(y1), r7=453(x2), r8=11(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 0
LDI r2, 49
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 121
LDI r7, 453
LDI r8, 11
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
