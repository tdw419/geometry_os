; DESCRIPTION: Composite: Places a purple line segment connecting (56, 162) to (463, 0) then Places a black 97x58 rectangle at position (251, 198).
; PLAN: r0=56(x1), r1=162(y1), r2=463(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=198(y), r7=97(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 162
LDI r2, 463
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 198
LDI r7, 97
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
