; DESCRIPTION: Composite: . Then Draws a red line from (111, 189) to (84, 210). Then Sets a single magenta pixel at (97, 214).
; PLAN: r0=111(x1), r1=189(y1), r2=84(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (111, 189) to (84, 210).
; PLAN: r0=111(x1), r1=189(y1), r2=84(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 189
LDI r2, 84
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (97, 214).
; PLAN: r0=97(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
