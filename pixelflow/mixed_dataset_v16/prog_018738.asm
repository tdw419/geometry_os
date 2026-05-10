; DESCRIPTION: Composite: Renders a red line between points (475, 2) and (471, 231) then Renders a magenta box of size 59x41 starting at (368, 166).
; PLAN: r0=475(x1), r1=2(y1), r2=471(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=166(y), r7=59(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 2
LDI r2, 471
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 166
LDI r7, 59
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
