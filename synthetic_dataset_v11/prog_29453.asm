; DESCRIPTION: Composite: . Then Sets a single orange pixel at (26, 173). Then Renders a blue line between points (39, 184) and (79, 105).
; PLAN: r0=26(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=39(x1), r1=184(y1), r2=79(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (26, 173).
; PLAN: r0=26(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (39, 184) and (79, 105).
; PLAN: r0=39(x1), r1=184(y1), r2=79(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 184
LDI r2, 79
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
