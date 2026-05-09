; DESCRIPTION: Composite: . Then Draws a blue line from (24, 123) to (231, 34). Then Draws a black circle centered at (30, 96) with radius 25.
; PLAN: r0=24(x1), r1=123(y1), r2=231(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=96(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (24, 123) to (231, 34).
; PLAN: r0=24(x1), r1=123(y1), r2=231(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 123
LDI r2, 231
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (30, 96) with radius 25.
; PLAN: r0=30(x), r1=96(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 96
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
