; DESCRIPTION: Composite: Renders a cyan line between points (434, 189) and (360, 118) then Sets a single yellow pixel at (466, 238).
; PLAN: r0=434(x1), r1=189(y1), r2=360(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 189
LDI r2, 360
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
