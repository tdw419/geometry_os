; DESCRIPTION: Composite: . Then Places a red line segment connecting (157, 230) to (126, 90). Then Places a magenta circle of radius 31 at center (171, 44).
; PLAN: r0=157(x1), r1=230(y1), r2=126(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=44(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (157, 230) to (126, 90).
; PLAN: r0=157(x1), r1=230(y1), r2=126(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 230
LDI r2, 126
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 31 at center (171, 44).
; PLAN: r0=171(x), r1=44(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 44
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
