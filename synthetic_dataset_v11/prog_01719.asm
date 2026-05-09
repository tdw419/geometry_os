; DESCRIPTION: Composite: . Then Sets a single black pixel at (252, 151). Then Draws a purple line from (184, 182) to (55, 248).
; PLAN: r0=252(x), r1=151(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=184(x1), r1=182(y1), r2=55(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (252, 151).
; PLAN: r0=252(x), r1=151(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 151
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (184, 182) to (55, 248).
; PLAN: r0=184(x1), r1=182(y1), r2=55(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 182
LDI r2, 55
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
