; DESCRIPTION: Composite: Draws a purple circle centered at (305, 175) with radius 75 then Draws a red line from (505, 121) to (449, 58).
; PLAN: r0=305(x), r1=175(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x1), r6=121(y1), r7=449(x2), r8=58(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 175
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 121
LDI r7, 449
LDI r8, 58
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
