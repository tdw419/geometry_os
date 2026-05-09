; DESCRIPTION: Composite: . Then Draws a black line from (63, 238) to (17, 78). Then Draws a red circle centered at (174, 208) with radius 38.
; PLAN: r0=63(x1), r1=238(y1), r2=17(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=208(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (63, 238) to (17, 78).
; PLAN: r0=63(x1), r1=238(y1), r2=17(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 238
LDI r2, 17
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (174, 208) with radius 38.
; PLAN: r0=174(x), r1=208(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 208
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
