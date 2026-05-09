; DESCRIPTION: Composite: . Then Draws a red circle centered at (133, 167) with radius 39. Then Draws a black line from (158, 32) to (199, 251).
; PLAN: r0=133(x), r1=167(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x1), r1=32(y1), r2=199(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (133, 167) with radius 39.
; PLAN: r0=133(x), r1=167(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 167
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (158, 32) to (199, 251).
; PLAN: r0=158(x1), r1=32(y1), r2=199(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 32
LDI r2, 199
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
