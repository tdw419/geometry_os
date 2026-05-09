; DESCRIPTION: Composite: Renders a white line between points (258, 66) and (6, 118) then Places a purple 90x96 rectangle at position (20, 22).
; PLAN: r0=258(x1), r1=66(y1), r2=6(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=22(y), r7=90(width), r8=96(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 66
LDI r2, 6
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 22
LDI r7, 90
LDI r8, 96
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
