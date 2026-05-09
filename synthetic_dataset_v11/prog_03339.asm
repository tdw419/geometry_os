; DESCRIPTION: Composite: . Then Renders a green line between points (77, 139) and (87, 188). Then Sets a single cyan pixel at (114, 14).
; PLAN: r0=77(x1), r1=139(y1), r2=87(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (77, 139) and (87, 188).
; PLAN: r0=77(x1), r1=139(y1), r2=87(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 139
LDI r2, 87
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (114, 14).
; PLAN: r0=114(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
