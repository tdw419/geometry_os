; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (175, 12). Then Draws a red line from (134, 21) to (64, 185).
; PLAN: r0=175(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=134(x1), r1=21(y1), r2=64(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (175, 12).
; PLAN: r0=175(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (134, 21) to (64, 185).
; PLAN: r0=134(x1), r1=21(y1), r2=64(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 21
LDI r2, 64
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
