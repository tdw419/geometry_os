; DESCRIPTION: Composite: . Then Sets a single red pixel at (120, 133). Then Draws a blue line from (78, 197) to (210, 1).
; PLAN: r0=120(x), r1=133(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=78(x1), r1=197(y1), r2=210(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (120, 133).
; PLAN: r0=120(x), r1=133(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 133
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (78, 197) to (210, 1).
; PLAN: r0=78(x1), r1=197(y1), r2=210(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 197
LDI r2, 210
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
