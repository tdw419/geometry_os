; DESCRIPTION: Composite: . Then Sets a single purple pixel at (104, 16). Then Places a black line segment connecting (216, 75) to (173, 109).
; PLAN: r0=104(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=216(x1), r1=75(y1), r2=173(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (104, 16).
; PLAN: r0=104(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (216, 75) to (173, 109).
; PLAN: r0=216(x1), r1=75(y1), r2=173(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 75
LDI r2, 173
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
