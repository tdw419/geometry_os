; DESCRIPTION: Composite: . Then Draws a purple line from (232, 202) to (189, 83). Then Sets a single yellow pixel at (65, 163).
; PLAN: r0=232(x1), r1=202(y1), r2=189(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=65(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (232, 202) to (189, 83).
; PLAN: r0=232(x1), r1=202(y1), r2=189(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 202
LDI r2, 189
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (65, 163).
; PLAN: r0=65(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
