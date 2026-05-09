; DESCRIPTION: Composite: . Then Places a blue dot at position (229, 77). Then Renders a cyan line between points (47, 245) and (157, 191).
; PLAN: r0=229(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=47(x1), r1=245(y1), r2=157(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (229, 77).
; PLAN: r0=229(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (47, 245) and (157, 191).
; PLAN: r0=47(x1), r1=245(y1), r2=157(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 245
LDI r2, 157
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
