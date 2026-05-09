; DESCRIPTION: Composite: . Then Sets a single purple pixel at (194, 185). Then Renders a blue line between points (74, 214) and (189, 71).
; PLAN: r0=194(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=74(x1), r1=214(y1), r2=189(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (194, 185).
; PLAN: r0=194(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (74, 214) and (189, 71).
; PLAN: r0=74(x1), r1=214(y1), r2=189(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 214
LDI r2, 189
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
