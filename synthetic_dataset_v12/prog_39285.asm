; DESCRIPTION: Composite: Renders a yellow box of size 34x85 starting at (213, 118) then Renders a red line between points (368, 212) and (13, 41).
; PLAN: r0=213(x), r1=118(y), r2=34(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=212(y1), r7=13(x2), r8=41(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 118
LDI r2, 34
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 212
LDI r7, 13
LDI r8, 41
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
