; DESCRIPTION: Composite: . Then Places a green line segment connecting (253, 73) to (78, 41). Then Sets a single purple pixel at (178, 228).
; PLAN: r0=253(x1), r1=73(y1), r2=78(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (253, 73) to (78, 41).
; PLAN: r0=253(x1), r1=73(y1), r2=78(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 73
LDI r2, 78
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (178, 228).
; PLAN: r0=178(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
