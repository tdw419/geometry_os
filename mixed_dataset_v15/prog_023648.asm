; DESCRIPTION: Composite: Draws a magenta line from (352, 109) to (236, 159) then Places a red 118x78 rectangle at position (132, 130).
; PLAN: r0=352(x1), r1=109(y1), r2=236(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=130(y), r7=118(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 109
LDI r2, 236
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 130
LDI r7, 118
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
