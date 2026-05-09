; DESCRIPTION: Composite: . Then Renders a purple line between points (84, 213) and (175, 144). Then Sets a single magenta pixel at (124, 253).
; PLAN: r0=84(x1), r1=213(y1), r2=175(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (84, 213) and (175, 144).
; PLAN: r0=84(x1), r1=213(y1), r2=175(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 213
LDI r2, 175
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (124, 253).
; PLAN: r0=124(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
