; DESCRIPTION: Composite: . Then Draws a magenta line from (133, 158) to (162, 102). Then Creates a yellow circular shape at (82, 160) with radius 22.
; PLAN: r0=133(x1), r1=158(y1), r2=162(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=160(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (133, 158) to (162, 102).
; PLAN: r0=133(x1), r1=158(y1), r2=162(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 158
LDI r2, 162
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (82, 160) with radius 22.
; PLAN: r0=82(x), r1=160(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 160
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
