; DESCRIPTION: Composite: . Then Draws a black line from (167, 18) to (158, 128). Then Places a purple circle of radius 62 at center (133, 138).
; PLAN: r0=167(x1), r1=18(y1), r2=158(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=138(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (167, 18) to (158, 128).
; PLAN: r0=167(x1), r1=18(y1), r2=158(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 18
LDI r2, 158
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 62 at center (133, 138).
; PLAN: r0=133(x), r1=138(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 138
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
