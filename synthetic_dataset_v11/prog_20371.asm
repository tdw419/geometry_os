; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (96, 83). Then Renders a blue line between points (94, 123) and (185, 217).
; PLAN: r0=96(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=94(x1), r1=123(y1), r2=185(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (96, 83).
; PLAN: r0=96(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 83
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (94, 123) and (185, 217).
; PLAN: r0=94(x1), r1=123(y1), r2=185(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 123
LDI r2, 185
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
