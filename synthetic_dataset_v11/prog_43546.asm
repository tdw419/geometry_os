; DESCRIPTION: Composite: . Then Places a purple line segment connecting (67, 0) to (3, 243). Then Draws a red circle centered at (183, 117) with radius 66.
; PLAN: r0=67(x1), r1=0(y1), r2=3(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=183(x), r1=117(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (67, 0) to (3, 243).
; PLAN: r0=67(x1), r1=0(y1), r2=3(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 0
LDI r2, 3
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (183, 117) with radius 66.
; PLAN: r0=183(x), r1=117(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 117
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
