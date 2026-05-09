; DESCRIPTION: Composite: . Then Places a white dot at position (11, 37). Then Draws a purple line from (134, 96) to (112, 175).
; PLAN: r0=11(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=134(x1), r1=96(y1), r2=112(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (11, 37).
; PLAN: r0=11(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (134, 96) to (112, 175).
; PLAN: r0=134(x1), r1=96(y1), r2=112(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 96
LDI r2, 112
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
