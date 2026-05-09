; DESCRIPTION: Composite: . Then Draws a yellow line from (86, 225) to (45, 88). Then Draws a purple circle centered at (66, 92) with radius 65.
; PLAN: r0=86(x1), r1=225(y1), r2=45(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=66(x), r1=92(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (86, 225) to (45, 88).
; PLAN: r0=86(x1), r1=225(y1), r2=45(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 225
LDI r2, 45
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (66, 92) with radius 65.
; PLAN: r0=66(x), r1=92(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 92
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
