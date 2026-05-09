; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (47, 4) to (60, 179). Then Sets a single purple pixel at (23, 0).
; PLAN: r0=47(x1), r1=4(y1), r2=60(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=23(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (47, 4) to (60, 179).
; PLAN: r0=47(x1), r1=4(y1), r2=60(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 4
LDI r2, 60
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (23, 0).
; PLAN: r0=23(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
