; DESCRIPTION: Composite: . Then Draws a purple line from (234, 112) to (190, 170). Then Draws a black circle centered at (102, 126) with radius 75.
; PLAN: r0=234(x1), r1=112(y1), r2=190(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=126(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (234, 112) to (190, 170).
; PLAN: r0=234(x1), r1=112(y1), r2=190(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 112
LDI r2, 190
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (102, 126) with radius 75.
; PLAN: r0=102(x), r1=126(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 126
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
