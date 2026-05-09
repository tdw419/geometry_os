; DESCRIPTION: Composite: Draws a magenta circle centered at (58, 189) with radius 22 then Draws a magenta line from (131, 219) to (161, 141).
; PLAN: r0=58(x), r1=189(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=219(y1), r7=161(x2), r8=141(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 189
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 219
LDI r7, 161
LDI r8, 141
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
