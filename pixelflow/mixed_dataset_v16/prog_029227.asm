; DESCRIPTION: Composite: Draws a black rectangle at (381, 139) with width 110 and height 64 then Places a purple line segment connecting (217, 253) to (216, 131).
; PLAN: r0=381(x), r1=139(y), r2=110(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x1), r6=253(y1), r7=216(x2), r8=131(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 139
LDI r2, 110
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 253
LDI r7, 216
LDI r8, 131
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
