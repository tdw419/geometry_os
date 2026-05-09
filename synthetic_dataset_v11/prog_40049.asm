; DESCRIPTION: Composite: . Then Renders a cyan line between points (192, 164) and (57, 98). Then Sets a single magenta pixel at (185, 183).
; PLAN: r0=192(x1), r1=164(y1), r2=57(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=185(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (192, 164) and (57, 98).
; PLAN: r0=192(x1), r1=164(y1), r2=57(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 164
LDI r2, 57
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (185, 183).
; PLAN: r0=185(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
