; DESCRIPTION: Composite: . Then Sets a single white pixel at (181, 252). Then Places a black line segment connecting (118, 179) to (237, 125).
; PLAN: r0=181(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=118(x1), r1=179(y1), r2=237(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (181, 252).
; PLAN: r0=181(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (118, 179) to (237, 125).
; PLAN: r0=118(x1), r1=179(y1), r2=237(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 179
LDI r2, 237
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
