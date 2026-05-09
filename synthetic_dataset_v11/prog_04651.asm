; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (136, 182). Then Draws a purple line from (54, 105) to (3, 134).
; PLAN: r0=136(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=54(x1), r1=105(y1), r2=3(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (136, 182).
; PLAN: r0=136(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (54, 105) to (3, 134).
; PLAN: r0=54(x1), r1=105(y1), r2=3(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 105
LDI r2, 3
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
