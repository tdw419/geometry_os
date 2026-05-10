; DESCRIPTION: Composite: Creates a black circular shape at (141, 139) with radius 63 then Draws a magenta line from (9, 176) to (333, 241).
; PLAN: r0=141(x), r1=139(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x1), r6=176(y1), r7=333(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 139
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 176
LDI r7, 333
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
