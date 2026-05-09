; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (148, 110) with radius 58. Then Draws a cyan line from (11, 212) to (203, 106).
; PLAN: r0=148(x), r1=110(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=11(x1), r1=212(y1), r2=203(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (148, 110) with radius 58.
; PLAN: r0=148(x), r1=110(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 110
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (11, 212) to (203, 106).
; PLAN: r0=11(x1), r1=212(y1), r2=203(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 212
LDI r2, 203
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
