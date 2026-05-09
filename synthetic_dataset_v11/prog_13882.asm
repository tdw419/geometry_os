; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (36, 107). Then Renders a cyan line between points (150, 131) and (93, 205).
; PLAN: r0=36(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=150(x1), r1=131(y1), r2=93(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (36, 107).
; PLAN: r0=36(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (150, 131) and (93, 205).
; PLAN: r0=150(x1), r1=131(y1), r2=93(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 131
LDI r2, 93
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
