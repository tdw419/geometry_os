; DESCRIPTION: Composite: . Then Renders a green line between points (10, 21) and (246, 176). Then Draws a green circle centered at (61, 122) with radius 61.
; PLAN: r0=10(x1), r1=21(y1), r2=246(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=122(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (10, 21) and (246, 176).
; PLAN: r0=10(x1), r1=21(y1), r2=246(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 21
LDI r2, 246
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (61, 122) with radius 61.
; PLAN: r0=61(x), r1=122(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 122
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
