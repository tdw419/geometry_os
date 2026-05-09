; DESCRIPTION: Composite: . Then Sets a single purple pixel at (118, 165). Then Draws a blue line from (121, 181) to (102, 241).
; PLAN: r0=118(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=121(x1), r1=181(y1), r2=102(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (118, 165).
; PLAN: r0=118(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (121, 181) to (102, 241).
; PLAN: r0=121(x1), r1=181(y1), r2=102(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 181
LDI r2, 102
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
