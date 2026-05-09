; DESCRIPTION: Composite: . Then Renders a blue line between points (126, 72) and (67, 217). Then Sets a single black pixel at (31, 215).
; PLAN: r0=126(x1), r1=72(y1), r2=67(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (126, 72) and (67, 217).
; PLAN: r0=126(x1), r1=72(y1), r2=67(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 72
LDI r2, 67
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (31, 215).
; PLAN: r0=31(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
HALT
