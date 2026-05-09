; DESCRIPTION: Composite: . Then Sets a single green pixel at (58, 90). Then Renders a purple line between points (75, 239) and (14, 206).
; PLAN: r0=58(x), r1=90(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=75(x1), r1=239(y1), r2=14(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (58, 90).
; PLAN: r0=58(x), r1=90(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 90
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (75, 239) and (14, 206).
; PLAN: r0=75(x1), r1=239(y1), r2=14(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 239
LDI r2, 14
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
