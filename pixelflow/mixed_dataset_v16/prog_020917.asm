; DESCRIPTION: Composite: Renders a purple line between points (430, 133) and (225, 226) then Places a orange 36x106 rectangle at position (140, 144).
; PLAN: r0=430(x1), r1=133(y1), r2=225(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=144(y), r7=36(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 133
LDI r2, 225
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 144
LDI r7, 36
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
