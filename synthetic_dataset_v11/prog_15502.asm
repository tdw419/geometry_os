; DESCRIPTION: Composite: . Then Draws a yellow line from (29, 160) to (37, 140). Then Draws a yellow circle centered at (90, 114) with radius 26.
; PLAN: r0=29(x1), r1=160(y1), r2=37(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=90(x), r1=114(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (29, 160) to (37, 140).
; PLAN: r0=29(x1), r1=160(y1), r2=37(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 160
LDI r2, 37
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (90, 114) with radius 26.
; PLAN: r0=90(x), r1=114(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 114
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
