; DESCRIPTION: Composite: . Then Renders a black line between points (40, 251) and (22, 218). Then Renders a purple box of size 118x18 starting at (18, 208).
; PLAN: r0=40(x1), r1=251(y1), r2=22(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=208(y), r2=118(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (40, 251) and (22, 218).
; PLAN: r0=40(x1), r1=251(y1), r2=22(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 251
LDI r2, 22
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 118x18 starting at (18, 208).
; PLAN: r0=18(x), r1=208(y), r2=118(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 208
LDI r2, 118
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
