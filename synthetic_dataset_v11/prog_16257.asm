; DESCRIPTION: Composite: . Then Draws a green circle centered at (131, 129) with radius 25. Then Draws a purple line from (105, 246) to (61, 149).
; PLAN: r0=131(x), r1=129(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=105(x1), r1=246(y1), r2=61(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (131, 129) with radius 25.
; PLAN: r0=131(x), r1=129(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 129
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (105, 246) to (61, 149).
; PLAN: r0=105(x1), r1=246(y1), r2=61(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 246
LDI r2, 61
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
