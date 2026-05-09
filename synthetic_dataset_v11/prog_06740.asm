; DESCRIPTION: Composite: . Then Renders a purple line between points (76, 80) and (241, 226). Then Places a cyan dot at position (137, 133).
; PLAN: r0=76(x1), r1=80(y1), r2=241(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=137(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (76, 80) and (241, 226).
; PLAN: r0=76(x1), r1=80(y1), r2=241(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 80
LDI r2, 241
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (137, 133).
; PLAN: r0=137(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
