; DESCRIPTION: Composite: . Then Draws a red line from (150, 235) to (88, 104). Then Creates a blue circular shape at (49, 170) with radius 39.
; PLAN: r0=150(x1), r1=235(y1), r2=88(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=170(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (150, 235) to (88, 104).
; PLAN: r0=150(x1), r1=235(y1), r2=88(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 235
LDI r2, 88
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (49, 170) with radius 39.
; PLAN: r0=49(x), r1=170(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 170
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
