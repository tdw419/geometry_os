; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (162, 174) with radius 36. Then Draws a magenta line from (181, 207) to (110, 0).
; PLAN: r0=162(x), r1=174(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x1), r1=207(y1), r2=110(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (162, 174) with radius 36.
; PLAN: r0=162(x), r1=174(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 174
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (181, 207) to (110, 0).
; PLAN: r0=181(x1), r1=207(y1), r2=110(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 207
LDI r2, 110
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
