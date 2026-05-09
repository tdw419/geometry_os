; DESCRIPTION: Composite: . Then Renders a blue line between points (220, 145) and (12, 210). Then Sets a single red pixel at (73, 218).
; PLAN: r0=220(x1), r1=145(y1), r2=12(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (220, 145) and (12, 210).
; PLAN: r0=220(x1), r1=145(y1), r2=12(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 145
LDI r2, 12
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (73, 218).
; PLAN: r0=73(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
