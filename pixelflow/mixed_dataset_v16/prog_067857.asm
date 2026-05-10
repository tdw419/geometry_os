; DESCRIPTION: Composite: Places a white line segment connecting (194, 198) to (511, 183) then Places a purple 58x25 rectangle at position (159, 2).
; PLAN: r0=194(x1), r1=198(y1), r2=511(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=2(y), r7=58(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 198
LDI r2, 511
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 2
LDI r7, 58
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
