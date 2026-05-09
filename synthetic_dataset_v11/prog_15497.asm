; DESCRIPTION: Composite: . Then Places a red line segment connecting (199, 13) to (230, 215). Then Sets a single purple pixel at (246, 117).
; PLAN: r0=199(x1), r1=13(y1), r2=230(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=246(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (199, 13) to (230, 215).
; PLAN: r0=199(x1), r1=13(y1), r2=230(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 13
LDI r2, 230
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (246, 117).
; PLAN: r0=246(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
