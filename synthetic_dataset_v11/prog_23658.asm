; DESCRIPTION: Composite: . Then Places a purple line segment connecting (93, 215) to (166, 84). Then Places a cyan dot at position (142, 252).
; PLAN: r0=93(x1), r1=215(y1), r2=166(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=142(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (93, 215) to (166, 84).
; PLAN: r0=93(x1), r1=215(y1), r2=166(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 215
LDI r2, 166
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (142, 252).
; PLAN: r0=142(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
