; DESCRIPTION: Composite: . Then Sets a single purple pixel at (180, 201). Then Renders a red line between points (92, 193) and (22, 55).
; PLAN: r0=180(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=92(x1), r1=193(y1), r2=22(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (180, 201).
; PLAN: r0=180(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (92, 193) and (22, 55).
; PLAN: r0=92(x1), r1=193(y1), r2=22(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 193
LDI r2, 22
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
