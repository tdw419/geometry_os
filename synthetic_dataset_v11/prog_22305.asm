; DESCRIPTION: Composite: . Then Renders a blue line between points (102, 41) and (97, 150). Then Creates a cyan circular shape at (91, 118) with radius 74.
; PLAN: r0=102(x1), r1=41(y1), r2=97(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=118(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (102, 41) and (97, 150).
; PLAN: r0=102(x1), r1=41(y1), r2=97(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 41
LDI r2, 97
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (91, 118) with radius 74.
; PLAN: r0=91(x), r1=118(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 118
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
