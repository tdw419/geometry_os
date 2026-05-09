; DESCRIPTION: Composite: . Then Places a purple line segment connecting (120, 95) to (144, 228). Then Sets a single black pixel at (208, 153).
; PLAN: r0=120(x1), r1=95(y1), r2=144(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=208(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (120, 95) to (144, 228).
; PLAN: r0=120(x1), r1=95(y1), r2=144(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 95
LDI r2, 144
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (208, 153).
; PLAN: r0=208(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
HALT
