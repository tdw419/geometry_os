; DESCRIPTION: Composite: Renders a cyan line between points (126, 89) and (47, 103) then Sets a single magenta pixel at (359, 29).
; PLAN: r0=126(x1), r1=89(y1), r2=47(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=29(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 89
LDI r2, 47
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 29
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
