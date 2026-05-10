; DESCRIPTION: Composite: Draws a purple circle centered at (117, 74) with radius 22 then Draws a magenta line from (258, 236) to (259, 100).
; PLAN: r0=117(x), r1=74(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x1), r6=236(y1), r7=259(x2), r8=100(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 74
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 236
LDI r7, 259
LDI r8, 100
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
