; DESCRIPTION: Composite: . Then Places a purple line segment connecting (112, 90) to (8, 24). Then Sets a single cyan pixel at (118, 164).
; PLAN: r0=112(x1), r1=90(y1), r2=8(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (112, 90) to (8, 24).
; PLAN: r0=112(x1), r1=90(y1), r2=8(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 90
LDI r2, 8
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (118, 164).
; PLAN: r0=118(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 164
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
