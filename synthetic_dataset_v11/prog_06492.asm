; DESCRIPTION: Composite: . Then Renders a black line between points (33, 143) and (40, 35). Then Sets a single magenta pixel at (110, 161).
; PLAN: r0=33(x1), r1=143(y1), r2=40(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=110(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (33, 143) and (40, 35).
; PLAN: r0=33(x1), r1=143(y1), r2=40(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 143
LDI r2, 40
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (110, 161).
; PLAN: r0=110(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
