; DESCRIPTION: Composite: Renders a orange line between points (148, 172) and (315, 253) then Places a magenta 118x93 rectangle at position (97, 117).
; PLAN: r0=148(x1), r1=172(y1), r2=315(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=117(y), r7=118(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 172
LDI r2, 315
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 117
LDI r7, 118
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
