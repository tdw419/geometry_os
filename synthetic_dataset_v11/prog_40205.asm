; DESCRIPTION: Composite: . Then Draws a magenta line from (7, 95) to (158, 201). Then Draws a black circle centered at (231, 220) with radius 18.
; PLAN: r0=7(x1), r1=95(y1), r2=158(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=231(x), r1=220(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (7, 95) to (158, 201).
; PLAN: r0=7(x1), r1=95(y1), r2=158(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 95
LDI r2, 158
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (231, 220) with radius 18.
; PLAN: r0=231(x), r1=220(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 220
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
