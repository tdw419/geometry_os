; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (131, 172). Then Renders a cyan line between points (33, 29) and (85, 71).
; PLAN: r0=131(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=33(x1), r1=29(y1), r2=85(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (131, 172).
; PLAN: r0=131(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (33, 29) and (85, 71).
; PLAN: r0=33(x1), r1=29(y1), r2=85(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 29
LDI r2, 85
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
