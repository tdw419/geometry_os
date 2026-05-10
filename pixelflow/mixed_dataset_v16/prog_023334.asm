; DESCRIPTION: Composite: Places a red line segment connecting (54, 177) to (93, 192) then Renders a yellow box of size 84x41 starting at (114, 11).
; PLAN: r0=54(x1), r1=177(y1), r2=93(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=11(y), r7=84(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 177
LDI r2, 93
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 11
LDI r7, 84
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
