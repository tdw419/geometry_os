; DESCRIPTION: Composite: Renders a purple box of size 118x60 starting at (4, 142) then Draws a orange line from (93, 131) to (55, 112).
; PLAN: r0=4(x), r1=142(y), r2=118(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x1), r6=131(y1), r7=55(x2), r8=112(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 142
LDI r2, 118
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 131
LDI r7, 55
LDI r8, 112
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
